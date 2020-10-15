require "rails_helper"

RSpec.feature "Users can see the ghosts" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:ghost) { FactoryBot.create(:ghost, first_name: 'Mike', last_name: 'Duchou') }
  let!(:ghost1) { FactoryBot.create(:ghost, first_name: 'Marcel', last_name: 'Pita') }

  before do
    login_as user
  end

  scenario "when there is no users found, the user can see the links to be redirect to the ghost index" do
    visit users_path

    fill_in "name", with: 'Blabla'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Aucun alumni ne correspond à votre recherche."
    expect(page).to have_link "Accèder aux profils non-inscrits"
  end

  scenario "when a user is searching for a ghost, he found the good one" do
    visit ghosts_path

    fill_in "name", with: 'Marcel'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Pita"
    expect(page).to_not have_content "Duchou"
  end
end
