module Resolvers
  module Post
    class PostsResolver < Resolvers::BaseResolver
      type Types::PostType.connection_type, null: false
      argument :status, Types::PostStatusType, required: false

      def resolve(status: nil, **args) # collect all arguement into a ruby hash
        # return  ::Post.all.order(created_at: :asc)
        posts = ::Post.all.order(created_at: :asc)
        # conditonal filtering
        if status.present?
          posts = posts.where(status: status)
        end
        posts
      end
    end
  end
end
