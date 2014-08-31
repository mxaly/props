class Prop < ActiveRecord::Base
  belongs_to :user
  belongs_to :propser, class_name: 'User'

  validates :user_id, :propser, :body, presence: true
  validate :can_prop, on: :create

  scope :with_includes, -> { includes(:user, :propser) }
  scope :ordered, -> { order('props.created_at DESC') }

  private

  def can_prop
    self.errors.add(:user_id, "You can't give a prop to yourself... It's not how the world works:)") if user.present? && (propser == user)
  end
end
