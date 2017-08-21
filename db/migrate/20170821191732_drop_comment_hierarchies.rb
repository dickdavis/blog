class DropCommentHierarchies < ActiveRecord::Migration[5.1]
  def change
    drop_table :comment_hierarchies
  end
end
