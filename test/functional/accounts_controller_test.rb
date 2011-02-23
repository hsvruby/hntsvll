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
end
