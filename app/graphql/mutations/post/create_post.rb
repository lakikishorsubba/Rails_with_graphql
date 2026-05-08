module Mutations
  module Post
    class CreatePost < Mutations::BaseMutation
      # request
      argument :title, String, required: false
      argument :body,  String, required: false
      argument :status, Types::PostStatusType, required: true

      # respose type
      type Types::PostType, null: false

      def resolve(title:, body:, status:)
        ::Post.create!(title: title, body: body, status: status, user_id: context[:current_user].id)
      end
    end
  end
end
