class PropSerializer < BaseSerializer
  attributes :id, :user, :propser, :body, :created_at

  has_one :user
  has_one :propser, serializer: UserSerializer
end
