class AccountsController < ApplicationController
  respond_to :html, :js, :json

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
    @accounts = Account.confirmed.order(order_by_expression)
    if params[:search].present?
      @accounts = @accounts.search(params[:search])
    end

    respond_with @accounts
  end

  def autocomplete
    respond_with Account.confirmed.search(params[:term]).order('first_name').map { |a| a.full_name }.uniq
  end

  private

  def set_order_by
    # Defaults
    session[:order_by] ||= 'random'
    session[:order_by_seed] ||= rand(1000000)

    # Override by request
    if params[:order_by].present? && AccountsHelper::ORDER_BY_OPTIONS.has_value?(params[:order_by])
      session[:order_by] = params[:order_by]
    end
  end

  def order_by_expression
    if session[:order_by] == 'random'
      # This is Postgres specific.  There is no analogous statement (as far as
      # I can tell) in sqlite
      begin
        ActiveRecord::Base.connection.execute("SELECT setseed(%d)" % session[:order_by_seed])
      rescue ActiveRecord::StatementInvalid
        Rails.logger.warn("Could not set random seed.  Order will not be saved between requests.")
      end

      'RANDOM()'
    else
      session[:order_by]
    end
  end
end
