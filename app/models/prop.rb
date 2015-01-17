class Prop < ActiveRecord::Base
  USER_LIMIT = 9
  private_constant :USER_LIMIT

  has_many :users, through: :prop_receivers
  has_many :prop_receivers
  has_many :upvotes
  belongs_to :propser, class_name: 'User'

  validates :propser, :body, presence: true
  validate :has_prop_receivers, :selfpropsing, :receivers_limit

  scope :with_includes, -> { includes(:users, :propser) }
  scope :ordered, -> { order('props.created_at DESC') }

  private

  def has_prop_receivers
    errors.add(:user_ids, I18n.t('props.errors.no_users')) unless prop_receivers.any?
  end

  def selfpropsing
    errors.add(:user_ids, I18n.t('props.errors.selfpropsing')) if prop_receivers.any? { |r| r.user_id == propser_id }
  end

  def receivers_limit
    errors.add(:user_ids, I18n.t('props.errors.user_limit')) if prop_receivers.length > USER_LIMIT
  end
end
