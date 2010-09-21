require "#{File.dirname(__FILE__)}/spec_helper"

describe Tumbling do
  subject { Tumbling }

  describe '#blog=' do
    it 'should set Resource.base_uri as the blog url' do
      subject.blog = 'foobar'
      
      Tumbling::Resource.base_uri.should eql('http://foobar.tumblr.com')
    end
  end
end