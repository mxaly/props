class PropSerializer < BaseSerializer
  attributes :id, :user, :propser, :body

  has_one :user
  has_one :propser, serializer: UserSerializer
end
