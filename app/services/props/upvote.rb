module Props
  class Upvote
    pattr_initialize [:prop!, :user!, :upvotes_repository!]

    def call
      upvotes_repository.add(prop, user)
    end
  end
end
