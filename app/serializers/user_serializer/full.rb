module UserSerializer
  class Full < Base
    attributes :props_count

    def props_count
      {
        given: user_props_repository.given.count,
        received: user_props_repository.received.count,
      }
    end

    private

    def user_props_repository
      UserPropsRepository.new(object)
    end
  end
end
