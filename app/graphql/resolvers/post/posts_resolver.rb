module Resolvers
  module Post
    class PostsResolver < Resolvers::BaseResolver
      type Types::PostType.connection_type, null: false
      argument :status, Types::PostStatusType, required: false
      argument :author_id, ID, required: false
      argument :post, String, required: false
      argument :body, String, required: false

      def resolve(status: nil, author_id: nil, title: nil, body: nil, **args) # collect all arguement into a ruby hash
        # return  ::Post.all.order(created_at: :asc)
        posts = ::Post.all.order(created_at: :asc)
        # conditonal filtering
        if status.present?
          posts = posts.where(status: status)
        end

        if author_id.present?
          posts = posts.where(user_id: author_id)
        end
        if title.present?
          posts = posts.where("title ILIKE ?", "%#{title}%")
        end

        if body.present?
          posts = posts.where("body ILIKE ?", "%#{body}%")
        end
        posts
      end
    end
  end
end
