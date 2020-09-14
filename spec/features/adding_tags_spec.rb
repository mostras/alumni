require "rails_helper"

RSpec.feature "Users can add tags" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diploma) { FactoryBot.create(:diploma, name: 'PREPA') }

  before do
    login_as user
  end

  scenario "Successfully" do
    visit edit_user_path(user)

    select diploma.name, from: "tag_diploma_id"
    select 2012, from: "tag_year"

    click_button "Ajouter"

    expect(page).to have_content("Le tag a bien été ajouté.")

    within ".tags-index" do
      expect(page).to have_content("PREPA\n2012")
    end
  end
end
