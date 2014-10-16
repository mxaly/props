module Props
  class Create
    pattr_initialize :props_repository, :attrs

    def call
      prop = create_prop attrs
      if prop.persisted?
        send_notification(prop)
        Response::Success.new(data: prop)
      else
        Response::Error.new(errors: prop.errors)
      end
    end

    private

    def create_prop(prop_attrs)
      props_repository.add prop_attrs
    end

    def send_notification(prop)
    end
  end
end
