class PropsRepository
  delegate :find, to: :all

  def all
    Prop.includes(:user, :propser, :upvotes)
  end

  def add(attributes)
    Prop.create(attributes)
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
