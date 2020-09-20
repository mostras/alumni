class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.string :title
      t.string :start_time
      t.string :end_time
      t.string :location
      t.boolean :current
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
