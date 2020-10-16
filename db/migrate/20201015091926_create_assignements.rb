class CreateAssignements < ActiveRecord::Migration[6.0]
  def change
    create_table :assignements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
