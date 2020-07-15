class ChangeCurrentDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :jobs, :current, from: nil, to: false
    change_column_default :diplomas, :current, from: nil, to: false
  end
end
