module Resolvers
  module Post
    class PostsResolver < Resolvers::BaseResolver
      type [ Types::PostType ], null: false

      def resolve
        # return  ::Post.all.order(created_at: :asc)
        ::Post.all.order(created_at: :asc)
      end
    end
  end
end
