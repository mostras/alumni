require "rails_helper"

RSpec.feature "Viewing own profil" do
  let(:user) { FactoryBot.create(:user) }
  let(:user_looking_for_job) { FactoryBot.create(:user, :looking_for_job, email: 'a@gmailcom') }
  let(:user_company_hire) { FactoryBot.create(:user, :company_hire, email: 'b@gmailcom') }


  scenario "With right informations" do
    login_as(user)
    visit user_path(user)

    expect(page).to have_content user.full_name
  end

  scenario "With right informations and looking for job notification" do
    login_as(user_looking_for_job)
    visit user_path(user_looking_for_job)

    expect(page).to have_content user_looking_for_job.full_name
    expect(page).to have_content "JE RECHERCHE UN EMPLOI / STAGE"
  end

  scenario "With right informations and company hire notification" do
    login_as(user_company_hire)
    visit user_path(user_company_hire)

    expect(page).to have_content user_company_hire.full_name
    expect(page).to have_content "MON ENTREPRISE RECRUTE"
  end
end
