class CreateUserSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sectors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end
