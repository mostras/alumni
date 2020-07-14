class ChangeStartTimeAndEndTimeToBeStringInJobs < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :start_time, :string
    change_column :jobs, :end_time, :string
  end
end
