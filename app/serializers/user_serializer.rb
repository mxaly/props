class UserSerializer < BaseSerializer
  attributes :id, :name, :email
end

class UserSerializer::Full < UserSerializer
  attributes :props_count

  def props_count
    object.props.count
  end
end
