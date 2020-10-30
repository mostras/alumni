class CreateParsings < ActiveRecord::Migration[6.0]
  def change
    create_table :parsings do |t|
      t.boolean :on_sheet, default: false
      t.boolean :parse, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
