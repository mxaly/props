module Api::V1
  class PropsController < Api::PropsController
    skip_filter :authenticate_user!
    check_token_on :index, :total, :create

    private

    def current_user
      User.find_by(email: prop_attributes[:propser_email])
    end

    def prop_attributes
      user_emails = params.delete(:user_emails)
      params.merge(user_ids: User.where(email: user_emails))

      propser_email = params.attributes.delete(:propser_email)
      params.merge(propser_id: User.find_by(email: propser_email))

      params.require(:prop).permit(:body, :user_emails, :propser_email)
    end
  end
end
