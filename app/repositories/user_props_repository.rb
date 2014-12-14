class UserPropsRepository
  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def given
    Prop.where(propser_id: user.id)
  end

  def received
    user.props
  end
end
