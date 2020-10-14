require "rails_helper"

RSpec.feature "Users can search for companies" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:company1) { FactoryBot.create(:company, name: 'Google', city: 'Paris') }
  let!(:company2) { FactoryBot.create(:company, name: 'Microsoft', city: 'Marseille') }
  let!(:company3) { FactoryBot.create(:company, name: 'Airbus', city: 'Lyon') }


  before do
    login_as user
    visit companies_path
  end

  scenario "can see all the companies" do
    expect(page).to have_content "Paris"
    expect(page).to have_content "Marseille"
    expect(page).to have_content "Lyon"
  end

  scenario "can search for a specic company by name" do
    fill_in "name", with: 'Google'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Google"
    expect(page).to_not have_content "Airbus"
    expect(page).to_not have_content "Microsoft"
  end

  scenario "can search for a specic company by city" do
    select 'Lyon', from: 'city'
    click_button 'Valider mes filtres'

    expect(page).to have_content "Airbus"
    expect(page).to_not have_content "Google"
    expect(page).to_not have_content "Microsoft"
  end
end
