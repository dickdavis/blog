class ChangePostsToLinks < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :links
  end
end
