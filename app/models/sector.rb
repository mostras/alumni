class Sector < ApplicationRecord
  has_many :user_sectors, dependent: :destroy
end
