module Api
  class UpvotesController < ApplicationController
    expose(:props_repository) { PropsRepository.new }
    expose(:prop) { props_repository.find(params[:prop_id]) }
    expose(:upvotes_repository) { UpvotesRepository.new }

    def create
      Props::Upvote.new(prop: prop,
                        user: current_user,
                        upvotes_repository: upvotes_repository).call
      render json: prop.reload, user: current_user, serializer: PropSerializer
    end
  end
end
