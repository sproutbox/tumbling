module Tumbling
  class Photo < Resource

    attr_accessor \
      :id,
      :url,
      :date,
      :format,
      :slug,
      :body,
      :title,
      :images

    private

    def self.from_api_attributes(attributes)
      {
        :id     => attributes['id'],
        :url    => attributes['url_with_slug'],
        :date   => attributes['date_gmt'],
        :format => attributes['format'],
        :slug   => attributes['slug'],
        :body   => build_body(attributes['photo_url']),
        :title  => attributes['photo_caption'],
        :tags   => attributes['tag']
      }
    end

    def self.build_body(urls)

      urls.collect { |x| Image.new(x).to_html }
    end

    #
    # @return [String] get all posts with a type of regular
    def self.type
      'photo'
    end

    class Image
      attr_accessor :url, :alt
      def initialize(url, alt = nil)
        @url = url
        @alt = alt
      end
      def to_html
        "<img src=\"#{url}\" alt=\"#{alt}\" />"
      end
    end
  end
end