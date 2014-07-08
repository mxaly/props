class PropsRepository
  def all
    Prop.all
  end

  def add(attributes)
    Prop.create(attributes)
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
