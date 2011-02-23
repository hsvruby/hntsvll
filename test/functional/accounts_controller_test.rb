require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  context "GET #new" do
    setup do
      get :new
    end

    should respond_with(:success)
    should render_template(:new)
    should assign_to(:account)
  end

  context "POST #create" do
    context "valid input" do
      setup do
        post :create, {:first_name => 'Joe', :last_name => 'Plumber', :email => 'joe_the_plumber@example.com'}
      end

      should respond_with(:success)
      should render_template(:created_pending_confirmation)
      should assign_to(:account)
    end
  end

  context "GET #index" do
    setup do
      get :index
    end

    should respond_with(:success)
    should render_template(:index)
    should assign_to(:accounts)
  end
end
