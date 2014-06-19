class Api::PropsController < AuthenticatedController
  expose(:props_repository) { PropsRepository.new }

  def index
    prop_search = props_repository.search search_params

    render json: prop_search.results
  end

  private

  def search_params
    params.permit(:user_id, :propser_id)
  end
end
