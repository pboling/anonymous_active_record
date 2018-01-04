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
  # Factory initializes instances of a pseudo anonymous class in a particular namespace of your choosing.
  class Factory
    attr_reader :klass

    def initialize(source_data, klass)
      @source_data = source_data # an array of hashes
      @klass = klass
    end

    def run
      @source_data.map do |hash|
        klass.create!(hash)
      end
    end
  end
end
