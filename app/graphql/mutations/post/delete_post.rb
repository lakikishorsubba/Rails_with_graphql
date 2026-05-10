module Mutations
  module Post
    class DeletePost < Mutations::BaseMutation
      argument :id, ID, required: true
      # argument :title, String, required: true
      # argument :body, String, required: true
      type Types::PostType, null: false

      def resolve(id:)
        post = ::Post.find_by(id: id)

        if post.nil?
          raise ::NotFoundError, "Post with id #{id} not found"
        end

        if post.user_id != context[:current_user].id
          raise ::UnauthorizedError, "Unauthorized: you are not the author of this post with id: #{id}"
        end

        post.destroy!
        post
      end
    end
  end
end
