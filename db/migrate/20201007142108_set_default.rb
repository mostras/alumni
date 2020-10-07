class SetDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :work_experiences, :current, :boolean, default: false
    change_column :school_experiences, :current, :boolean, default: false
  end
end
