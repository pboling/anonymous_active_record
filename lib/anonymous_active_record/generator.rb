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
module AnonymousActiveRecord
  # Generator defines a pseudo anonymous class in a particular namespace of your choosing.
  class Generator
    DEFAULT_NAME = 'anons'.freeze

    attr_reader :klass_namespaces, :table_name, :klass_name

    def initialize(table_name, klass_namespaces = [], klass_basename = nil)
      @klass_namespaces = Array(klass_namespaces).map(&:to_s).map {|x| x.gsub(/[^a-z0-9]+/i, '_') }
      klass_context = [(klass_basename || DEFAULT_NAME).gsub(/[^a-z0-9]+/i, '_').capitalize, SecureRandom.uuid.gsub(/[^a-z0-9]+/i, '_')].join('_')
      @table_name = (table_name || klass_context).downcase.to_s
      # String#capitalize is Ruby >= 2.4, https://stackoverflow.com/a/3725154/213191
      @klass_name = (klass_namespaces << klass_context).join('::')
    end

    def generate(&block)
      # Many moons ago, ActiveRecord allowed anonymous classes to be created like:
      #   Class.new(ActiveRecord::Base)
      # which was useful for specs, and other use cases.  But it is now explicitly not supported, see
      #   https://github.com/rails/rails/issues/8934
      eval "class ::#{klass_name} < ActiveRecord::Base; end"
      klass = Kernel.const_get(klass_name, true)
      klass.class_eval(&block) if block_given?
      klass.table_name = table_name
      klass
    end
  end
end
