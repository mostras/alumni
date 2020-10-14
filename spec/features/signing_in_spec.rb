require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "When providing valid details" do
    visit root_path

    click_link "Je me connecte"
    fill_in "Email", with: user.email
    fill_in "Mot de passe", with: user.password
    click_button "Se connecter"

    expect(page).to have_content("Connecté.")
  end
end
