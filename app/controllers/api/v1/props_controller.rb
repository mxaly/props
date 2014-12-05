module Api::V1
  class PropsController < Api::PropsController
    skip_filter :authenticate_user!
    check_token_on :index, :total, :create
  end
end
