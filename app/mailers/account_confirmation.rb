class AccountConfirmation < ActionMailer::Base
  default :from => "confirm@hntsvll.com"

  def confirm_account(account)
    @account = account
    @url = confirmation_url(:host => "hntsvll.com", :token => account.token)
    mail(:to => account.email, :subject => "Please confirm your hntsvll account.")
  end

end
