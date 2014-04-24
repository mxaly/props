class Api::UsersController < AuthenticatedController
  def index
    render json: User.all
  end
end
