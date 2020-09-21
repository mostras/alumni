class UserSector < ApplicationRecord
  belongs_to :user
  belongs_to :sector
  validates_associated :user

  # validate :check_sum_sector

  private

  # def check_sum_sector
  #   if user.user_sectors.size >= 5
  #     errors.add :base, 'There can only be one global setting/your message here'
  #   end
  # end

end
