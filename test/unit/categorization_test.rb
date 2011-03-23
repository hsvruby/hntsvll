require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  should belong_to :account
  should belong_to :category
  
  should validate_presence_of :account
  should validate_presence_of :category
end
