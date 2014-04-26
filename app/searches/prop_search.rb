class PropSearch < Searchlight::Search
  search_on Prop.includes(:user, :propser)

  searches :user_id

  def search_user_id
    search.where user_id: user_id
  end
end
