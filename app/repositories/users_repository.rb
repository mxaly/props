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
end
