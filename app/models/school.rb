class School < ApplicationRecord
  has_many :school_experiences, dependent: :destroy
end

