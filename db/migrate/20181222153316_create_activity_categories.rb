class CreateActivityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_categories do |t|
      t.string :label
      t.string :description

      t.timestamps
    end

    add_reference :activities, :activity_category, foreign_key: true
  end
end
