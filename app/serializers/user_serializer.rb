class UserSerializer < BaseSerializer
  attributes :id, :name, :email
end

class UserSerializer::Full < UserSerializer
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
