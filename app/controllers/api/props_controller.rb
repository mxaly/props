class Api::PropsController < AuthenticatedController
  def index
    render json: Prop.includes(:user, :propser)
  end
end
