class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zip
      t.string :sector
      t.integer :number_employees
      t.string :linkedin_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :website_url
      t.string :job_offer_url


      t.timestamps
    end
  end
end
