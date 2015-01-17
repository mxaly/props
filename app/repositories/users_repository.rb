class UsersRepository
  def all
    User.all.order(:name)
  end

  def find_by_id(id)
    User.find(id)
  end

  def find_by_email(email)
    User.find_by_email(email)
  end

  def user_from_auth(auth)
    User.where(
      provider: auth['provider'],
      uid: auth['uid'].to_s,
    ).first || User.create_with_omniauth(auth)
  end
end
