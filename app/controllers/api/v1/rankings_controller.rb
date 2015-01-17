module Api
  module V1
    class RankingsController < ApiController
      skip_filter :authenticate_user!
      check_token_on :hero_of_the_week

      expose(:props_repository) { PropsRepository.new }
      expose(:users_repository) { UsersRepository.new }
      expose(:ranking_repository) do
        RankingRepository.new users_repository, props_repository
      end

      def hero_of_the_week
        render json: ranking_repository.hero_of_the_week.to_json
      end
    end
  end
end
