class PropsRepository
  def all
    Prop.all
  end

  def search(attributes)
    PropSearch.new attributes
  end
end
