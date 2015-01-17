module Api
  module V1
    class RankingsController < ApiController
      skip_filter :authenticate_user!
      check_token_on :hero_of_the_week

      expose(:props_repository) { PropsRepository.new }
      expose(:users_repository) { UsersRepository.new }

      def hero_of_the_week
        time_range = (1.week.ago..Time.now)
        props = props_repository.all.where(created_at: time_range)
        hash = propsed_users(props)
        render json: most_propsed(hash).to_json
      end

      private

      def propsed_users(props)
        hash = {}
        props.each do |prop|
          prop.prop_receivers.each do |receiver|
            if hash.key?(receiver.user_id)
              hash[receiver.user_id] += 1
            else
              hash.merge!(receiver.user_id => 1)
            end
          end
        end
        hash
      end

      def most_propsed(hash)
        top = hash.sort_by { |_key, value| value }.last
        user = users_repository.find_by_id(top[0]).name
        props_count = top[1]
        { user: user, props_count: props_count }
      end
    end
  end
end
