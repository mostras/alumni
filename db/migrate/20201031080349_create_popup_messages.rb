class CreatePopupMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :popup_messages do |t|
      t.text :message
      t.string :link
      t.string :link_title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
