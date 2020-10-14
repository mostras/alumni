require "rails_helper"

RSpec.feature "Users can sign up" do

  scenario "when providing valid details" do
    visit root_path

    click_link "Je crée mon compte"
    fill_in "Prénom", with: 'Adrien'
    fill_in "Nom", with: 'Barbier'
    fill_in "Email", with: "test@example.com"
    fill_in "Mot de passe", with: "password"
    fill_in "Confirmation du mot de passe", with: "password"
    click_button "Suivant"

    expect(page).to have_content("Bienvenue, vous êtes connecté.")
  end
end
