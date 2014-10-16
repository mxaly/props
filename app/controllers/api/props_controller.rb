class Api::PropsController < AuthenticatedController
  expose(:props_repository) { PropsRepository.new }

  def index
    prop_search = props_repository.search search_params

    render json: prop_search.results
  end

  def create
    create_prop = Props::Create.new(props_repository, prop_attributtes).call
    if create_prop.success?
      render json: create_prop.data
    else
      render json: { errors: create_prop.errors }, status: :unprocessable_entity
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
