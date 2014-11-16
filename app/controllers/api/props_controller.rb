class Api::PropsController < AuthenticatedController
  expose(:props_repository) { PropsRepository.new }

  def index
    search_attrs = search_params.merge!(
      show_upvote_status_for_user_id: current_user.id)
    prop_search = props_repository.search search_attrs

    render json: prop_search.results.page(params[:page])
  end

  def total
    render text: Prop.count
  end

  def create
    create_prop = Props::Create.new(props_repository, prop_attributtes).call
    if create_prop.success?
      render json: create_prop.data
    else
      render json: { errors: create_prop.errors }, status: :unprocessable_entity, serializer: false
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
