module AnonymousActiveRecord
  # Factory initializes instances of a pseudo anonymous class in a particular namespace of your choosing.
  class Factory
    attr_reader :klass

    def initialize(source_data, klass)
      @source_data = source_data # an array of hashes
      @klass = klass
    end

    def run
      @source_data.each do |hash|
        klass.create!(hash)
      end
    end
  end
end
