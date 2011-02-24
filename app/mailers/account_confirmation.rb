class AccountConfirmation < ActionMailer::Base
  default :from => "confirm@hntsvll.com"
  
  def confirm_account
    @account = account
    @url = account_confirmation_path(account)
    mail(:to => account.email, :subject => "Please confirm your hntsvll account.")
  end
  
end
