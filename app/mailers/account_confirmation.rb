class AccountConfirmation < ActionMailer::Base
  default :from => "confirm@hntsvll.com"

  def confirm_account(account)
    @account = account
    @url = confirmation_url(:host => "hntsvll.com", :token => account.token, :email => account.email)
    mail(:to => account.email, :subject => "Please confirm your hntsvll account.")
  end

  def edit_account(account)
    @account = account
    @url = update_url(:host => "hntsvll.com", :token => account.token, :email => account.email)
    mail(:to => account.email, :subject => "Your token to edit your hntsvll account.")
  end
end
