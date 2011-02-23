class AccountsController < ApplicationController
  respond_to :html

  def new
    @account = Account.new
    respond_with @account
  end

  def create
    @account = Account.new(params[:account])
    respond_to do |format|
      if @account.save
        format.html { render 'created_pending_confirmation' }
      else
        format.html { render 'new' }
      end
    end
  end

  def index
    @accounts = Account.all
    respond_with @accounts
  end
end
