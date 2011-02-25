class AccountsController < ApplicationController
  respond_to :html, :js

  before_filter :set_order_by, :only => :index

  def new
    @account = Account.new
    @categories = Category.all
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
    order_by = if session[:order_by] == 'random'
                 session[:order_by_seed]
               else
                 session[:order_by]
               end

    @accounts = Account.confirmed.order(order_by)
    respond_with @accounts
  end

  private

  def set_order_by
    # Defaults
    session[:order_by] ||= 'random'
    session[:order_by_seed] ||= rand

    # Override by request
    if params[:order_by].present? && AccountsHelper::ORDER_BY_OPTIONS.has_value?(params[:order_by])
      session[:order_by] = params[:order_by]
    end
  end
end
