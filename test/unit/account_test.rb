require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)

  should validate_presence_of(:page_url)

  should have_attached_file(:avatar)
  should validate_attachment_presence(:avatar)
  should validate_attachment_content_type(:avatar).
    allowing('image/jpg', 'image/gif', 'image/png').
    rejecting('text/plain', 'application/octet-stream')

  should allow_value("http://google.com").for(:page_url)
  should_not allow_value("ht://catsarecool").for(:page_url)

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

  should "generate a token" do
    jane = accounts(:jane)
    jane.generate_token
    assert_not_nil jane.token
    assert_not_nil jane.token_expires_at
  end

  context "validating accounts" do

    should "confirm an account" do
      jane = accounts(:jane)
      jane.generate_token
      jane.save
      janes_token = jane.token
      jane.confirm_by_token(janes_token)
      jane.reload
      assert jane.confirmed?
    end

    should "clear validation token after validated" do
      jane = accounts(:jane)
      jane.generate_token
      jane.save
      janes_token = jane.token
      jane.confirm_by_token(janes_token)
      jane.reload
      refute jane.token
    end

  end

  should "have confirmed accounts" do
    assert Account.confirmed.all.include?(accounts(:oatmeal))
    refute Account.confirmed.all.include?(accounts(:jane))
  end

  should "search for first name and last name when given a term with a space" do
    assert_equal [accounts(:jane)], Account.search('Jane Plumb')
  end

  should "search for first name or last name when given a term without a space" do
    assert_equal [accounts(:harry), accounts(:jane), accounts(:joe)], Account.search('J').order('first_name')
  end

  should "remove token when editing" do
    jane = accounts(:jane)
    jane.generate_token
    jane.edit_by_token(jane.token)
    jane.reload
    refute jane.token
  end
end
