# frozen_string_literal: true

require 'rubygems'
require 'test/unit'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end
