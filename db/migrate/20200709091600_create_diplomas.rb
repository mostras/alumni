class CreateDiplomas < ActiveRecord::Migration[6.0]
  def change
    create_table :diplomas do |t|
      t.string :title
      t.date :start_time
      t.date :end_time
      t.boolean :current
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
