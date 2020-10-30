class Recruitment < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validate :check_if_exist


  def check_if_exist
    if Recruitment.where(user: user, company: company).any?
      errors[:base] << "Vous avez déjà signalé un recrutement pour cette entreprise."
    end
  end

end
