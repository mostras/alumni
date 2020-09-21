class UserSector < ApplicationRecord
  belongs_to :user
  belongs_to :sector
  # validate :check_sum_sector

  # def check_sum_sector
  #   if user.user_sectors.size > 5
  #     errors.add(:user_sector, "Vous ne pouvez pas ajouter plus de 5 secteurs.")
  #   end
  # end

end
