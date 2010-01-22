module Tumbling
  class Link < Resource

    attr_accessor \
      :id,
      :url,
      :date,
      :format,
      :slug,
      :body,
      :title,
      :tags

    private

    def self.from_api_attributes(attributes)
      {
        :id     => attributes['id'],
        :url    => attributes['url_with_slug'],
        :date   => attributes['date_gmt'],
        :format => attributes['format'],
        :slug   => attributes['slug'],
        :body   => attributes['link_url'],
        :title  => attributes['link_text'],
        :tags   => attributes['tag']
      }
    end

    #
    # @return [String] get all posts with a type of regular
    def self.type
      'link'
    end
  end
end