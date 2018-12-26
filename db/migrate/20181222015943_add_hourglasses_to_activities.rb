class AddHourglassesToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :hourglasses, :integer
    add_column :activities, :start_date, :date
    add_column :activities, :due_date, :date
    add_column :activities, :completion_date, :date
  end
end
