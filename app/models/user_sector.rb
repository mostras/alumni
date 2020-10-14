class UserSector < ApplicationRecord
  belongs_to :user
  belongs_to :sector

  validates_associated :user
end
