class PropsRepository
  delegate :find, to: :all

  def all
    Prop.includes(:user, :propser)
  end

  def add(attributes)
    user_ids = attributes.delete(:user_ids).split(',')
    prop = Prop.create(attributes)
    user_ids.each do |user_id|
      PropReceiver.create(prop_id: prop.id, user_id: user_id)
    end
    prop
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
