class SchoolExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :school
  accepts_nested_attributes_for :school
end
