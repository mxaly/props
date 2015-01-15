module Api::V1
  class PropsController < Api::PropsController
    skip_filter :authenticate_user!
    skip_before_filter  :verify_authenticity_token, only: :create
    check_token_on :index, :total, :create

    private

    def current_user
      token = params[:token]
      EasyTokens::Token.find_by_value(token).owner
    end
  end
end
