class PropsRepository
  delegate :find, to: :all

  def all
    Prop.includes(:users, :propser)
  end

  def add(attributes)
    Prop.create(attributes)
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
