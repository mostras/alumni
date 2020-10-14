require "rails_helper"

RSpec.feature "Editing links" do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user, email: 'test@gmail.com') }

  before do
    login_as user1
  end

  scenario "Should see links on his profile" do
    visit user_path(user1)

    expect(page).to have_link(nil, href: "/users/#{user1.id}/edit")
    expect(page).to have_link(nil, href: "/users/#{user1.id}/edit_situation")
    expect(page).to have_link(nil, href: '/tags')
    expect(page).to have_link(nil, href: '/user_sectors')
    expect(page).to have_link(nil, href: "/users/#{user1.id}/updating_profil_exp")
  end

  scenario "Should not see links on other profile" do
    visit user_path(user2)

    expect(page).to_not have_link(nil, href: "/users/#{user1.id}/edit")
    expect(page).to_not have_link(nil, href: "/users/#{user1.id}/edit_situation")
    expect(page).to_not have_link(nil, href: '/tags')
    expect(page).to_not have_link(nil, href: '/user_sectors')
    expect(page).to_not have_link(nil, href: "/users/#{user1.id}/updating_profil_exp")
  end
end
