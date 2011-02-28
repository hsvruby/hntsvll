require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  context "GET #new" do
    setup do
      get :new
    end

    should respond_with(:success)
    should render_template(:new)
    should assign_to(:account)
    should assign_to(:categories)
  end

  context "POST #create" do
    context "valid input" do
      setup do
        post :create, {
               :account => {
                 :first_name => 'Joe',
                 :last_name => 'Plumber',
                 :email => 'joe_the_plumber@example.com',
                 :page_url =>"http://example.com",
                 :category_ids => [Category.first.id],
                 :avatar => fixture_file_upload('/avatars/hooptie.jpg', 'image/jpg', :binary)
               }
             }
      end

      should respond_with(:success)
      should render_template(:created_pending_confirmation)
      should assign_to(:account)
    end

    context "invalid input" do
      setup do
        # First name missing
        post :create, {:account => {:first_name => '', :last_name => 'Plumber', :email => 'joe@example.com'}}
      end

      should respond_with(:success)
      should render_template(:new) # rerender new template showing errors
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

  context "GET #index with order_by last_name" do
    setup do
      get :index, { :order_by => 'last_name' }
    end

    should "respond with accounts sorted by last name" do
      assert_equal Account.confirmed.order('last_name'), assigns(:accounts)
    end
  end

  context "GET #index with search" do
    setup do
      get :index, { :search => 'Plumb' }
    end

    should "respond with accounts that match the search" do
      assert_equal [accounts(:joe)], assigns(:accounts)
    end
  end

  context "GET #autocomplete" do
    setup do
      get :autocomplete, { :term => 'Plumb', :format => :json }
    end

    should "respond with JSON list of autocomplete suggestions" do
      autocomplete_items = ActiveSupport::JSON.decode(response.body)
      assert_equal [accounts(:joe).full_name], autocomplete_items
    end
  end

  context "GET #edit" do
    context "with invalid token" do
      setup do
        jane = accounts(:jane)
        jane.generate_token!
        get :edit, {:id => jane.id}, {:token => "invalid_token"}
      end

      should redirect_to("/")
      should set_the_flash.to(/problem/)
    end

    context "with a valid token" do
      setup do
        jane = accounts(:jane)
        jane.generate_token!
        get :edit, {:id => jane.id}, {:token => jane.token}
      end
      should render_template(:edit)
    end
  end

  context "PUT #update" do
    context "with invalid token" do
      setup do
        jane = accounts(:jane)
        jane.generate_token!
        put :update, {:id => jane.id}, {:token => "invalid_token"}
      end

      should redirect_to(:controller => "update", :action => "edit")
      should set_the_flash.to(/problem/)
    end
    context "with valid input" do
      setup do
        jane = accounts(:jane)
        jane.generate_token!
        put :update, {
               :id => jane.id,
               :account => {
                 :first_name => 'Joe',
                 :last_name => 'Plumber',
                 :email => 'joe_the_plumber@example.com',
                 :page_url =>"http://example.com",
                 :category_ids => [Category.first.id],
                 :avatar => fixture_file_upload('/avatars/hooptie.jpg', 'image/jpg', :binary)
               }
             }, {:token => jane.token}
      end
      should redirect_to("/")
      should set_the_flash.to(/successfully/)
    end

    context "with invalid input" do
      setup do
        jane = accounts(:jane)
        jane.generate_token!
        put :update, {
               :id => jane.id,
               :account => {
                 :first_name => '',
                 :last_name => 'Plumber',
                 :email => 'joe_the_plumber@example.com',
                 :page_url =>"http://example.com",
                 :category_ids => [Category.first.id],
                 :avatar => fixture_file_upload('/avatars/hooptie.jpg', 'image/jpg', :binary)
               }
             }, {:token => jane.token}
      end

      should render_template(:edit) # rerender edit template showing errors
      should assign_to(:account)

    end
  end
end
