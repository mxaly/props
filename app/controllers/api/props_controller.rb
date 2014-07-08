class Api::PropsController < AuthenticatedController
  expose(:props_repository) { PropsRepository.new }

  def index
    prop_search = props_repository.search search_params

    render json: prop_search.results
  end

  def create
    prop = props_repository.add prop_attributtes
    if prop.persisted?
      render json: prop
    else
      render json: { errors: prop.errors }, status: :unprocessable_entity
    end
  end

  private

  def prop_attributtes
    params.require(:prop).permit(:user_id, :body).merge(propser_id: current_user.id)
  end

  def search_params
    params.permit(:user_id, :propser_id)
  end
end
