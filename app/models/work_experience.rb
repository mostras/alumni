class WorkExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :company, optional: true
end
