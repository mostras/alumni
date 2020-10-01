class UpdatingJson < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :linkedin_url, :string

    add_column :companies, :linkedin_url, :string
  end
end
