class Notifier
  class Base
    pattr_initialize :body, [:options]

    def call
      notify
    end
  end
end
