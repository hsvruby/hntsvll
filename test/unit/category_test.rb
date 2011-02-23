require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  should have_and_belong_to_many(:accounts)
end
