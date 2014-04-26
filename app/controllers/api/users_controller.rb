class Api::UsersController < AuthenticatedController
  def index
    render json: User.all
  end

  def show
    user = User.find params[:id]
    render json: user, serializer: UserSerializer::Full
  end
end
