require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)

  should "return full_name as first_name + last_name" do
    jane = accounts(:jane)
    assert_equal "#{jane.first_name} #{jane.last_name}", jane.full_name
  end
end
