class PropSerializer < BaseSerializer
  include ActionView::Helpers::SanitizeHelper

  attributes :id, :users, :propser, :body, :created_at, :upvotes_count,
             :is_upvote_possible

  has_many :users, serializer: UserSerializer
  has_one :propser, serializer: UserSerializer

  def body
    sanitize object.body, tags: %w(img)
  end

  def is_upvote_possible
    !((object.propser_id == scope.id) || user_has_upvoted?)
  end

  private

  def user_has_upvoted?
    if object.respond_to?(:user_has_upvoted?)
      object.user_has_upvoted
    else
      object.upvotes.exists?(user_id: scope.id)
    end
  end
end
