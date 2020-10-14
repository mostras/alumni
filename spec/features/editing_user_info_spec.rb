require "rails_helper"

RSpec.feature "Users can edit their info" do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as user
  end

  scenario "When providing valid details" do
    visit edit_user_path(user)

    fill_in 'user_linkedin_url', with: "www.adrien.com"
    fill_in "user_email", with: "adrien@gmail.com"
    fill_in "user_phone_number", with: "0679093717"
    fill_in "user_whatsapp_number", with: "0679093717"

    click_button "Valider les modifications"

    expect(page).to have_content("Vos modifications ont été enregistrées.")
    expect(page).to have_link(nil, href: 'www.adrien.com')
    expect(page).to have_link(nil, href: 'mailto:adrien@gmail.com')
    expect(page).to have_link(nil, href: 'tel:0679093717')
    expect(page).to have_link(nil, href: 'https://wa.me/+330679093717')
  end
end
