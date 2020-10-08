class AddOnGoogleSheetToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :on_google_sheet, :boolean, default: false
  end
end
