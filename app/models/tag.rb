class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :diploma

  validates :year, presence: true
  validates :diploma, presence: true

end

