require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "Successfully"do
    visit "/"

    click_link "Se déconnecter"

    expect(page).to have_content "Déconnecté."
  end
end
