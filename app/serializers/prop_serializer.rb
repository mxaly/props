class PropSerializer < BaseSerializer
  include ActionView::Helpers::SanitizeHelper

  attributes :id, :user, :propser, :body, :created_at

  has_one :user
  has_one :propser, serializer: UserSerializer

  def body
    sanitize object.body, tags: %w(img)
  end
end
