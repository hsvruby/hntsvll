require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  should have_many :categorizations
  should have_many(:accounts).through(:categorizations)
end
