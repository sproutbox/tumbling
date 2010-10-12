lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'tumbling/version'

Gem::Specification.new do |s|
  s.name        = "tumbling"
  s.version     = Tumbling::Version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cameron Cox"]
  s.email       = "cameron@sproutbox.com"
  s.homepage    = "http://github.com/cameroncox/tumbling"
  s.summary     = "A Tumblr API Wrapper in Ruby"
  s.description = "Integrates Tumblr into your Ruby Apps"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "httparty"
  s.add_development_dependency "rspec"

  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.markdown VERSION Gemfile Gemfile.lock)
  s.require_path = 'lib'
end