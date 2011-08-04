class AccountConfirmation < ActionMailer::Base
  default :from => "confirm@hntsvll.org"

  def confirm_account(account)
    @account = account
    @url = confirmation_url(:host => host_for_current_env, :token => account.token, :email => account.email)
    mail(:to => account.email, :subject => "Please confirm your hntsvll account.")
  end

  def edit_account(account)
    @account = account
    @url = update_url(:host => host_for_current_env, :token => account.token, :email => account.email)
    mail(:to => account.email, :subject => "Your token to edit your hntsvll account.")
  end
  
  private
  
  def host_for_current_env
    case RAILS_ENV
      when 'development' then 'http://localhost:3000'
      when 'production' then 'http://hntsvll.heroku.com'
    end
  end
end
