class CreateGhosts < ActiveRecord::Migration[6.0]
  def change
    create_table :ghosts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :notification_send, default: false

      t.timestamps
    end
  end
end
