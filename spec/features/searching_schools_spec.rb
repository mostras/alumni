require "rails_helper"

RSpec.feature "Users can search for schools" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:school1) { FactoryBot.create(:school, name: 'ESSEC', city: 'Paris') }
  let!(:school2) { FactoryBot.create(:school, name: 'GEM', city: 'Marseille') }
  let!(:school3) { FactoryBot.create(:school, name: 'HEC', city: 'Lyon') }


  before do
    login_as user
    visit schools_path
  end

  scenario "can see all the schools" do
    expect(page).to have_content 'Essec'
    expect(page).to have_content 'Gem'
    expect(page).to have_content 'Hec'
  end

  scenario "can search for a specic schools by name" do
    fill_in "name", with: 'ESSEC'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Essec"
    expect(page).to_not have_content "Hec"
    expect(page).to_not have_content "Gem"
  end

  scenario "can search for a specic school by city" do
    select 'Paris', from: 'city'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Essec"
    expect(page).to_not have_content "Hec"
    expect(page).to_not have_content "Gem"
  end
end
