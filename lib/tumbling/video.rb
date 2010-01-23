module Tumbling
  class Video < Resource

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
        :date   => parse_time(attributes['date_gmt']),
        :format => attributes['format'],
        :slug   => attributes['slug'],
        :body   => attributes['video_player'],
        :title  => attributes['video_caption'],
        :tags   => attributes['tag']
      }
    end

    #
    # @return [String] get all posts with a type of regular
    def self.type
      'video'
    end
  end
end