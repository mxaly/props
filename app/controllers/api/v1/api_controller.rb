module Api
  module V1
    class ApiController < AuthenticatedController
      skip_filter :authenticate_user!
      skip_before_filter :verify_authenticity_token, only: :create
    end
  end
end
