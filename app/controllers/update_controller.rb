class UpdateController < ApplicationController

  def new

  end

  def create
    account = Account.find_by_email(params[:email])
    logger.debug(account.inspect)
    if account
      account.generate_token!
      account.send_update_mail
      redirect_to root_path, :notice => "We have sent an email with your validation link inside."
    else
      redirect_to new_update_path, :error => "We couldn't find your email address in the system."
    end
  end

  def edit
    @email = params[:email]
  end

  def show
    @account = Account.find_by_email(params[:email])
    if @account && @account.edit_by_token(params[:token])
      session[:edit_token] = params[:token]
      redirect_to edit_account_path(@account), :notice => "You have successfully validated your token and can edit your profile."
    else
      render "edit", :alert => "There was a problem editing your account, please check your token."
    end
  end

end