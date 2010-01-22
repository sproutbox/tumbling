module Tumbling
  class Quote < Resource

    attr_accessor \
      :id,
      :url,
      :date,
      :format,
      :slug,
      :body,
      :title,
      :tags,
      :tags

    private

    def self.from_api_attributes(attributes)
      {
        :id     => attributes['id'],
        :url    => attributes['url_with_slug'],
        :date   => attributes['date_gmt'],
        :format => attributes['format'],
        :slug   => attributes['slug'],
        :body   => attributes['quote_text'],
        :title  => attributes['quote_source'],
        :tags   => attributes['tag']
      }
    end

    #
    # @return [String] get all posts with a type of regular
    def self.type
      'quote'
    end
  end
end