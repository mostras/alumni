class Company < ApplicationRecord
  has_many :work_experiences, dependent: :destroy
  has_many :users, through: :work_experiences
end
