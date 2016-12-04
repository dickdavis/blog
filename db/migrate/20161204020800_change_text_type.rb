class ChangeTextType < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :text, :text
  end
end
