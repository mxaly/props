class SessionsController < ApplicationController

  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth = request.env["omniauth.auth"]
    unless valid_email? auth.info.email
      return failure('Your email is invalid!')
    end
    user = User.where(provider: auth['provider'],
                      uid: auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user), alert: "Please enter your email address."
    else
      redirect_to app_path, notice: 'Signed in!'
    end

  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure(message = nil)
    message ||= params[:message].humanize
    redirect_to root_url, alert: "Authentication error: #{message}", status: :unauthorized
  end

  private

  def valid_email?(email)
    match = email.match(/.*\@(?<domain>.*\z)/)
    domain = match.present? ? match[:domain] : nil
    AppConfig.allowed_email_domains.include?(domain)
  end
end
