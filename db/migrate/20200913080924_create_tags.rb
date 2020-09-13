class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diploma, null: false, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
