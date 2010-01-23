module Tumbling
  class Resource
    include HTTParty
    format :xml

    def self.all(query = {})
      get_resources(type, query)
    end

    def type
      self.class.type
    end

    def self.build(attrs)
      new from_api_attributes(attrs)
    end

    private

    def self.parse_time(time)
      Time.parse(time)
    end

    def initialize(hash = {})
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def self.export_type_to_native_objects(results)
      if results.kind_of?(Array)
        @_results = []
        results.each do |result|
          @_results.push(export_type_to_native_object(result))
        end

        return @_results
      else
        return [export_type_to_native_object(results)]
      end
    end

    def self.export_type_to_native_object(result)
        type   = (result['type'] == 'regular') ? 'post' : result['type']
        object = Tumbling.const_get constantize_type(type)
        object.build(result)
    end

    def self.get_resources(type, query = {})
      query.merge!({ :type => type }) unless type.nil?

      results = get '/api/read', :query => query
      # return results
      if results['tumblr']
        return export_type_to_native_objects(results['tumblr']['posts']['post'])
      else
        []
      end
    end

    # The type of posts to get from the API
    #
    # @return [NilClass] nil for all post types
    def self.type
      nil
    end

    def self.constantize_type(type)
      type[0...1].upcase + type[1...type.length]
    end
  end
end