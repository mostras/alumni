require "rails_helper"

RSpec.feature "Users can search for other users" do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user, email: 'test2@gmail.com', last_name: 'Bouchon') }
  let!(:user3) { FactoryBot.create(:user, :looking_for_job, email: 'test3@gmail.com', last_name: 'Marcelin') }
  let!(:user4) { FactoryBot.create(:user, email: 'test4@gmail.com', last_name: 'Marco') }

  before do
    login_as user1
    visit users_path
  end

  scenario "can see all the users" do
    expect(page).to have_content "Bouchon"
    expect(page).to have_content "Marcelin"
    expect(page).to have_content "Marco"
  end

  scenario "can search for a specic user by name" do
    fill_in "name", with: 'Bouchon'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Bouchon"
    expect(page).to_not have_content "Marcelin"
    expect(page).to_not have_content "Marco"
  end

  scenario "can search for a specic user by situation" do
    select 'Recherche un emploie', from: 'look_for'
    click_button 'Valider mes filtres'

    expect(page).to_not have_content "Bouchon"
    expect(page).to have_content "Marcelin"
    expect(page).to_not have_content "Marco"
  end
end
