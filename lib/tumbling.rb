require 'time'
require 'httparty'

module Tumbling
  autoload :Version,  'tumbling/version'
  autoload :Resource, 'tumbling/resource'
  autoload :Post,     'tumbling/post'
#  quote, photo, link, chat, video, or audio

  autoload :Audio,        'tumbling/audio'
  autoload :Conversation, 'tumbling/conversation'
  autoload :Link,         'tumbling/link'
  autoload :Photo,        'tumbling/photo'
  autoload :Quote,        'tumbling/quote'
  autoload :Video,        'tumbling/video'

  class << self
    attr_accessor :email, :password

    def blog=(blog)
      Resource.base_uri "http://#{blog}.tumblr.com"
    end
  end
end