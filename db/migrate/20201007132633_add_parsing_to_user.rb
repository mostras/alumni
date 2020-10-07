class AddParsingToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :parsing, :boolean, default: false
  end
end
