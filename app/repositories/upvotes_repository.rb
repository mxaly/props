class UpvotesRepository
  def add(prop, user)
    Upvote.create!(prop_id: prop.id, user_id: user.id)
  end
end
