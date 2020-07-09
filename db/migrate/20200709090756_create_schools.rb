class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zip
      t.string :school_url

      t.timestamps
    end
  end
end
