require "rails_helper"

RSpec.feature "updating situation" do
  let(:user) { FactoryBot.create(:user) }

  scenario "when looking for a job" do
    login_as(user)
    visit edit_situation_user_path(user)

    check 'user_looking_for_job'
    click_button 'Valider les modifications'

    expect(page).to have_content "JE RECHERCHE UN EMPLOI"
    expect(page).to have_content "Vos modifications ont été enregistrées."
  end

  scenario "when looking for internship" do
    login_as(user)
    visit edit_situation_user_path(user)

    check 'user_looking_for_internship'
    click_button 'Valider les modifications'

    expect(page).to have_content "JE RECHERCHE UN STAGE"
    expect(page).to have_content "Vos modifications ont été enregistrées."
  end

  scenario "when company hire" do
    login_as(user)
    visit edit_situation_user_path(user)

    check 'user_company_hire'
    click_button 'Valider les modifications'

    expect(page).to have_content "MON ENTREPRISE RECRUTE"
    expect(page).to have_content "Vos modifications ont été enregistrées."
  end

end
