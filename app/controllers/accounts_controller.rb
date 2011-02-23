class AccountsController < ApplicationController
  respond_to :html

  def new
    @account = Account.new
    respond_with @account
  end
end
