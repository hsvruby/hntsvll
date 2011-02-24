ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Workaround for shoulda bug
# https://github.com/thoughtbot/shoulda/issues/117
unless defined?(Test::Unit::AssertionFailedError)
  class Test::Unit::AssertionFailedError < ActiveSupport::TestCase::Assertion
  end
end

# Monkey patch refute for those who are on Ruby 1.8
module Test::Unit::Assertions
  def refute(*args)
    args[0] = !args[0]
    assert(*args)
  end

  def refute_nil(*args)
    assert_not_nil(*args)
  end
end
