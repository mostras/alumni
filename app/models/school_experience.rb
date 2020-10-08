class SchoolExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :school
end
