class PropsRepository
  def all
    Prop.includes(:user, :propser)
  end

  def add(attributes)
    Prop.create(attributes)
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
