module UserSerializer
  class Base < BaseSerializer
    attributes :id, :name, :email, :avatar_url

    def avatar_url
      gravatar_url(object.email)
    end
  end
end
