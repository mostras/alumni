class AddColorToDiploma < ActiveRecord::Migration[6.0]
  def change
    add_column :diplomas, :color, :string
  end
end
