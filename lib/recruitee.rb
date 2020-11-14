# frozen_string_literal: true

BASE_DIR = "#{File.dirname(__FILE__)}/recruitee"

require 'faraday'
require 'faraday_middleware'
require 'forwardable'

# Version
require 'recruitee/version'

# API resource support classes
require 'recruitee/http/client'
require 'recruitee/client'
require 'recruitee/api_resource'
require 'recruitee/resource'
require 'recruitee/response'
require 'recruitee/util'

# Resources
Dir["#{BASE_DIR}/api/**/*.rb"].sort.each { |file| require file }
Dir["#{BASE_DIR}/resources/**/*.rb"].sort.each { |file| require file }

module Recruitee
end
