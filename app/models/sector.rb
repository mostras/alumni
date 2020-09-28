class Sector < ApplicationRecord
  has_many :user_sectors, dependent: :destroy
  has_many :users, :through => :user_sectors
end
