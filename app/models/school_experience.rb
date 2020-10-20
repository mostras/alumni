class SchoolExperience < ApplicationRecord
  include SetCurrentExp
  include CustomValidations

  belongs_to :user
  belongs_to :school
  accepts_nested_attributes_for :school

  before_create :titleize_title
  before_validation :is_current

  validate :custom_start_time
  validate :custom_end_time

  def titleize_title
    self.title = title.titleize
    self.location = location.titleize
  end
end
