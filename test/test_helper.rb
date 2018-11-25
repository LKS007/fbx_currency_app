require 'coveralls'
Coveralls.wear!('rails')


ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

#load "#{Rails.root}/db/seeds.rb"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  
  # Add more helper methods to be used by all tests here...
end
