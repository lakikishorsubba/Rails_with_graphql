# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # another convention
    self.field(:create_post, mutation: Mutations::Post::CreatePost)
    # since field is a class method, this is the alternative
    field :update_post, mutation: Mutations::Post::UpdatePost
    field :delete_post, mutation: Mutations::Post::DeletePost
  end
end
