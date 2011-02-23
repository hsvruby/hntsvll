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

  should have_and_belong_to_many(:categories)

  should "require an account be associated with at least one category" do
    jane = accounts(:jane)
    jane.categories = []

    refute jane.valid?
    refute_nil jane.errors[:categories]
  end

  should "require that an account be associated with no more than two categories" do
    jane = accounts(:jane)
    jane.categories = [categories(:developer), categories(:designer), categories(:blogger)]

    refute jane.valid?
    refute_nil jane.errors[:categories]
  end
end
