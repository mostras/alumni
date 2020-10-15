require "rails_helper"

RSpec.feature "ghosts have the invitation links hide or visible" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:ghost) { FactoryBot.create(:ghost, first_name: 'Mike', last_name: 'Duchou') }

  before do
    login_as user
  end

  scenario "when a ghost have a email, and didn't receive any invitation" do
    visit ghosts_path
    within ".ghost-index" do
      expect(page).to have_button "Envoyer une invitation"
    end
  end

  scenario "when a ghost don't have email" do
    ghost.update(email: '')

    visit ghosts_path

    within ".ghost-index" do
      expect(page).to have_content "Cette utilisateur n'a pas renseigné d'adresse email."
    end
  end

  scenario "when a ghost receive a invitation" do
    ghost.update(notification_send: true)

    visit ghosts_path

    within ".ghost-index" do
      expect(page).to have_content "Une notification a déjà été envoyé à cette utilisateur."
    end
  end
end
