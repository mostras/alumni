class CreateSchoolExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :school_experiences do |t|
      t.string :title
      t.string :start_time
      t.string :end_time
      t.string :location
      t.boolean :current
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
