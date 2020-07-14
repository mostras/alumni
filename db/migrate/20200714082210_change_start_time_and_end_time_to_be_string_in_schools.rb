class ChangeStartTimeAndEndTimeToBeStringInSchools < ActiveRecord::Migration[6.0]
  def change
    change_column :diplomas, :start_time, :string
    change_column :diplomas, :end_time, :string
  end
end
