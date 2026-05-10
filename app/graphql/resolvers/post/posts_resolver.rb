module Resolvers
  module Post
    class PostsResolver < Resolvers::BaseResolver
      type Types::PostType.connection_type, null: false

      def resolve(**args) # collect all arguement into a ruby hash
        # return  ::Post.all.order(created_at: :asc)
        ::Post.all.order(created_at: :asc)
      end
    end
  end
end
