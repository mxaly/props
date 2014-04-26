class Api::PropsController < AuthenticatedController
  def index
    prop_search = PropSearch.new search_params
    render json: prop_search.results
  end

  private

  def search_params
    params.permit(:user_id, :propser_id)
  end
end
