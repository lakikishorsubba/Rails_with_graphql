module Mutations
  module Post
    class CreatePost < Mutations::BaseMutation
      # request
      argument :title, String, required: false
      argument :body,  String, required: false

      # respose type
      type Types::PostType, null: false

      def resolve(title:, body:)
        ::Post.create!(title: title, body: body, user_id: context[:current_user].id)
      end
    end
  end
end
