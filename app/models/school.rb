class School < ApplicationRecord
  has_many :school_experiences, dependent: :destroy
  has_many :users, through: :school_experiences
end

