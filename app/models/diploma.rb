class Diploma < ApplicationRecord
  belongs_to :user
  belongs_to :school
end
