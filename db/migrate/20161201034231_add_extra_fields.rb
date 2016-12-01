class AddExtraFields < ActiveRecord::Migration[5.0]
  def change
    change_table :articles do |t|
      t.string :subtitle
      t.string :tags
      t.text :summary
    end
  end
end
