class ConfirmationsController < ApplicationController

  def new
  end

  def show
    @account = Account.confirm_by_token(params[:token])
    if @account && @account.confirmed?
      flash[:notice] = "You have successfully confirmed your account."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem confirming your account, please check your token."
      redirect_to new_confirmation_path
    end

  end

end
