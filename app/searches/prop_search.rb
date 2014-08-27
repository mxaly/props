class PropSearch < Searchlight::Search
  search_on Prop.includes(:user, :propser).order('props.created_at DESC')

  searches :user_id, :propser_id

  def search_user_id
    search.where user_id: user_id
  end

  def search_propser_id
    search.where propser_id: propser_id
  end
end
