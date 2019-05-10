require 'active_record'

require 'anonymous_active_record/version'
require 'anonymous_active_record/generator'
require 'anonymous_active_record/factory'

# Public API for AnonymousActiveRecord is:
#
#   AnonymousActiveRecord.generate -
#     defines a class, creates the table;
#     returns the class
#
#   Usage:
#
#     klass = AnonymousActiveRecord.generate(columns: ['name']) do
#               def flowery_name
#                 "🌸#{name}🌸"
#               end
#             end
#     instance = klass.new(name: 'Darla Charla')
#     instance.save!
#     instance.flowery_name # => "🌸Darla Charla🌸"
#
#   AnonymousActiveRecord.factory -
#     defines a class, creates the table, creates data;
#     returns inserted records
#
#   Usage:
#
#     records = AnonymousActiveRecord.factory(source_data: [{name: 'Bob McGurdy'}], columns: ['name']) do
#                 def flowery_name
#                   "🌸#{name}🌸"
#                 end
#               end
#     records.first.flowery_name # => "🌸Bob McGurdy🌸"
#
module AnonymousActiveRecord
  DEFAULT_CONNECTION_PARAMS = {
    adapter: 'sqlite3',
    encoding: 'utf8',
    database: ':memory:'
  }.freeze

  # Defines a pseudo anonymous class in a particular namespace of your choosing.
  def generate(table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], indexes: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS, &block)
    gen = AnonymousActiveRecord::Generator.new(table_name, klass_namespaces, klass_basename)
    klass = gen.generate(&block)
    connection_params = YAML.load_file(connection_params) if connection_params.is_a?(String)
    klass.establish_connection(connection_params.dup)
    klass.connection.create_table gen.table_name do |t|
      columns.each do |col|
        if col.is_a?(Hash)
          # :name and :type are required at minimum
          name = col.delete(:name)
          type = col.delete(:type)
          t.column(name, type, **col)
        else
          t.column col, :string
        end
      end
      indexes.each do |idx_options|
        column_names = idx_options.delete(:columns)
        t.index column_names, **idx_options
      end
      t.timestamps if timestamps
    end
    klass
  end

  # Initializes instances of a pseudo anonymous class in a particular namespace of your choosing.
  def factory(source_data: [], table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], indexes: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS, &block)
    factory = _factory(source_data: source_data, table_name: table_name, klass_namespaces: klass_namespaces, klass_basename: klass_basename, columns: columns, indexes: indexes, timestamps: timestamps, connection_params: connection_params, &block)
    factory.run
  end

  # Initializes instances of a pseudo anonymous class in a particular namespace of your choosing.
  def factory!(source_data: [], table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], indexes: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS, &block)
    factory = _factory(source_data: source_data, table_name: table_name, klass_namespaces: klass_namespaces, klass_basename: klass_basename, columns: columns, indexes: indexes, timestamps: timestamps, connection_params: connection_params, &block)
    factory.run!
  end

  private

  def _factory(source_data: [], table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], indexes: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS, &block)
    klass = generate(table_name: table_name, klass_namespaces: klass_namespaces, klass_basename: klass_basename, columns: columns, timestamps: timestamps, indexes: indexes, connection_params: connection_params, &block)
    AnonymousActiveRecord::Factory.new(source_data, klass)
  end

  module_function :generate, :factory, :factory!, :_factory
end
