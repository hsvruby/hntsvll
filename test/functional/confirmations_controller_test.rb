require 'test_helper'

class ConfirmationsControllerTest < ActionController::TestCase

  context "GET #show" do
    context "Valid key" do
      setup do
        @jane = accounts(:jane)
        @jane.generate_token!
        get :show, :token => @jane.token, :email => @jane.email
      end

      should respond_with(:redirect)
      should set_the_flash.to(/successfully/)
    end

  end

end
