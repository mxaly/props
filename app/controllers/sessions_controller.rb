class SessionsController < ApplicationController
  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    create_session = Sessions::Create.new(request.env['omniauth.auth']).call
    if create_session.success?
      sign_in_user create_session.data.fetch(:user)
    else
      failure(create_session.errors)
    end
  end

  def sign_in_user(user)
    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user),
                  alert: 'Please enter your email address.'
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
    redirect_to root_url, alert: "Authentication error: #{message}",
                          status: :unauthorized
  end
end
