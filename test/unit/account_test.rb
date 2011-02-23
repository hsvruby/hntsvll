require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
end
