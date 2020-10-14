require "rails_helper"

RSpec.feature "Users can add tags" do
  let(:user) { FactoryBot.create(:user) }
  let!(:diploma) { FactoryBot.create(:diploma, name: 'PREPA') }
  let!(:diploma1) { FactoryBot.create(:diploma, name: 'BAC') }
  let!(:tag) { FactoryBot.create(:tag, user: user, diploma: diploma, year: 2017) }
  let!(:tag1) { FactoryBot.create(:tag, user: user, diploma: diploma1, year: 2019) }

  before do
    login_as user
  end

  scenario "Successfully during the account creation" do
    visit tag_creation_tags_path

    select 'PREPA', from: "tag[diploma_id]"
    select 2012, from: "tag_year"
    click_button "Ajouter"

    within ".tags-index" do
      expect(page).to have_content("PREPA\n2012")
    end
  end

  scenario "Successfully within the profile" do
    visit tags_path

    select 'PREPA', from: "tag[diploma_id]"
    select 2012, from: "tag_year"
    click_button "Ajouter"

    within ".tags-index" do
      expect(page).to have_content("PREPA\n2012")
    end
  end

  scenario "Successfully within the profile" do
    visit user_path(user)

    within ".diplomas" do
      expect(page).to have_content("PREPA\n2017")
      expect(page).to have_content("BAC\n2019")
    end
  end
end
