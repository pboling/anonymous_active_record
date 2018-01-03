require 'active_record'

require 'anonymous_active_record/version'
require 'anonymous_active_record/generator'
require 'anonymous_active_record/factory'

module AnonymousActiveRecord
  DEFAULT_CONNECTION_PARAMS = {
      adapter: 'sqlite3',
      encoding: 'utf8',
      database: ':memory:'
  }.freeze

  # Defines a pseudo anonymous class in a particular namespace of your choosing.
  def generate(table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS)
    gen = AnonymousActiveRecord::Generator.new(table_name, klass_namespaces, klass_basename)
    klass = gen.generate
    connection_params = YAML.load_file(connection_params) if connection_params.is_a?(String)
    klass.establish_connection(connection_params.dup)
    klass.connection.create_table gen.table_name do |t|
      t.column :text, :text
      columns.each do |col|
        t.column col, :string
      end
      t.timestamps if timestamps
    end
    klass
  end

  # Initializes instances of a pseudo anonymous class in a particular namespace of your choosing.
  def factory(source_data: [], table_name: nil, klass_namespaces: [], klass_basename: nil, columns: [], timestamps: true, connection_params: DEFAULT_CONNECTION_PARAMS)
    klass = generate(table_name: table_name, klass_namespaces: klass_namespaces, klass_basename: klass_basename, columns: columns, timestamps: timestamps, connection_params: connection_params)
    factory = AnonymousActiveRecord::Factory.new(source_data, klass)
    factory.run
  end

  module_function :generate, :factory
end
