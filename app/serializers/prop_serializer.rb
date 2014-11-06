class PropSerializer < BaseSerializer
  include ActionView::Helpers::SanitizeHelper

  attributes :id, :user, :propser, :body, :created_at, :upvotes_count,
             :is_upvote_possible

  has_one :user
  has_one :propser, serializer: UserSerializer

  def body
    sanitize object.body, tags: %w(img)
  end

  def is_upvote_possible
    !([object.user_id, object.propser_id].include?(scope.id) || user_has_upvoted?)
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
