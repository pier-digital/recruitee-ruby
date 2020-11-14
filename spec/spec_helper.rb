# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

require 'faker'
require 'pry'
require 'rspec'
require 'rubocop'
require 'webmock/rspec'

require 'recruitee'

begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
  warn 'warning: simplecov gem not found; skipping coverage'
end

WebMock.disable_net_connect!
