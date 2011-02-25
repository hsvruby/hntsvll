class ConfirmationsController < ApplicationController

  def new
    @email = params[:email]
  end

  def show
    @account = Account.find_by_email(params[:email])
    if @account && @account.confirm_by_token(params[:token])
      flash[:notice] = "You have successfully confirmed your account."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem confirming your account, please check your token."
      redirect_to new_confirmation_path(:email => params[:email])
    end

  end

end
