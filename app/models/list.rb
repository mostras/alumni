class List < ApplicationRecord
  has_many :assignements, dependent: :destroy
  has_many :users, through: :assignements
  accepts_nested_attributes_for :users
end
