require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  should belong_to :account
  should belong_to :category
  
  should validate_presence_of :account_id
  should validate_presence_of :category_id
end
