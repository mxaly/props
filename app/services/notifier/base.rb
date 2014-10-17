class Notifier
  class Base
    pattr_initialize :notification, [:options]

    def call
      notify
    end
  end
end
