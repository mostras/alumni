class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :automatic_updating, :boolean
    add_column :users, :manual_updating, :boolean
  end
end
