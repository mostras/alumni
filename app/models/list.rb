class List < ApplicationRecord
  has_many :assignements
  has_many :users, through: :assignements
end
