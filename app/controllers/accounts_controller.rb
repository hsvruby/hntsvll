class AccountsController < ApplicationController
  respond_to :html

  def new
    @account = Account.new
    respond_with @account
  end

  def create
    @account = Account.create(params[:account])
    respond_to do |format|
      format.html { render 'created_pending_confirmation' }
    end
  end
end
