module AnonymousActiveRecord
  # Generator defines a pseudo anonymous class in a particular namespace of your choosing.
  class Generator
    DEFAULT_NAME = 'anons'.freeze

    attr_reader :klass_namespaces, :table_name, :klass_name

    def initialize(table_name, klass_namespaces = [], klass_basename = nil)
      @klass_namespaces = Array(klass_namespaces).map(&:to_s).map {|x| x.gsub(/[^a-z0-9]+/i, '_') }
      @table_name = (table_name || DEFAULT_NAME).downcase.to_s
      # String#capitalize is Ruby >= 2.4, https://stackoverflow.com/a/3725154/213191
      klass_context = [(klass_basename || self.table_name).gsub(/[^a-z0-9]+/i, '_').capitalize, SecureRandom.uuid.gsub(/[^a-z0-9]+/i, '_')].join('_')
      @klass_name = (klass_namespaces << klass_context).join('::')
    end

    def generate
      # Many moons ago, ActiveRecord allowed anonymous classes to be created like:
      #   Class.new(ActiveRecord::Base)
      # which was useful for specs, and other use cases.  But it is now explicitly not supported, see
      #   https://github.com/rails/rails/issues/8934
      eval "class ::#{klass_name} < ActiveRecord::Base; end"
      klass = Kernel.const_get(klass_name, true)
      klass.table_name = table_name
      klass
    end
  end
end
