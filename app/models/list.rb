class List < ApplicationRecord
  has_many :assignements, dependent: :destroy
  has_many :users, through: :assignements
end
