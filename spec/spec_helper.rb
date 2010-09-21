$LOAD_PATH.unshift << File.dirname(__FILE__)
$LOAD_PATH.unshift << "#{File.dirname(__FILE__)}/../lib"

require 'tumbling'
require 'bundler'

Bundler.setup

require 'rspec'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require(file) }

