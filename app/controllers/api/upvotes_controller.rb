module Api
  class UpvotesController < ApplicationController
    expose(:props_repository) { PropsRepository.new }
    expose(:prop) { props_repository.find(params[:prop_id]) }
    expose(:upvotes_repository) { UpvotesRepository.new }

    def create
      upvote_prop = Props::Upvote.new(
        prop: prop,
        user: current_user,
        upvotes_repository: upvotes_repository
      ).call
      if upvote_prop.success?
        render json: upvote_prop.data, user: current_user, serializer: PropSerializer
      else
        render json: { errors: upvote_prop.errors }, status: :unprocessable_entity, serializer: false
      end
    end
  end
end
