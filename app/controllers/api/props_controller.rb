class Api::PropsController < AuthenticatedController
  def index
    render json: Prop.all
  end
end
