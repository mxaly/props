class BaseSerializer < ActiveModel::Serializer
  def gravatar_url(email)
    Gravatar.new(email).image_url
  end
end
