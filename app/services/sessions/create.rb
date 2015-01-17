module Sessions
  class Create
    pattr_initialize :auth

    def call
      if valid_email? auth.info.email
        Response::Success.new(data: { user: user_from_auth(auth) })
      else
        Response::Error.new(errors: 'Your email is invalid!')
      end
    end

    private

    def user_from_auth(auth)
      @user ||= User.where(
        provider: auth['provider'],
        uid: auth['uid'].to_s,
      ).first || User.create_with_omniauth(auth)
    end

    def valid_auth?
    end

    def valid_email?(email)
      match = email.match(/.*\@(?<domain>.*\z)/)
      domain = match.present? ? match[:domain] : nil
      AppConfig.allowed_email_domains.include?(domain)
    end
  end
end
