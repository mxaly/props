class PropReceiver < ActiveRecord::Base
  USER_LIMIT = 9
  private_constant :USER_LIMIT

  belongs_to :prop
  belongs_to :user

  validates :prop_id, :user_id, presence: true
  validate :user_limit, on: :create

  private

  def user_limit
    self.errors.add(:user_id, "Sorry, you can't add more users to this prop") if PropReceiver.where(prop_id: prop_id).count > USER_LIMIT
  end
end
