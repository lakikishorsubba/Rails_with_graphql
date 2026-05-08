class RenameAuthorIdToUserIdInPosts < ActiveRecord::Migration[8.1]
  def change
    rename_column :posts, :author_id, :user_id
  end
end
