require 'rubygems'
require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'lazy_resource'

require 'fixtures/comment'
require 'fixtures/post'
require 'fixtures/user'

module LazyResource
  autoload :HttpMock
end

LazyResource.configure do |config|
  config.site = "http://example.com"
end

RSpec.configure do |config|
  config.mock_with :rspec
end
