class ChangeColumnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :automatic_updating, :boolean, default: false
    change_column :users, :manual_updating, :boolean, default: true
  end
end
