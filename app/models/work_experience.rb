class WorkExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :company
  accepts_nested_attributes_for :company

  validates :title, presence: true
  validates :start_time, presence: true
  validates :company, presence: true
end
