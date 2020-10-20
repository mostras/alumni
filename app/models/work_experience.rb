class WorkExperience < ApplicationRecord
  include SetCurrentExp
  include CustomValidations

  belongs_to :user
  belongs_to :company
  accepts_nested_attributes_for :company

  before_create :titleize_title
  before_validation :is_current

  validates :title, presence: true
  validates :start_time, presence: true, format: { with: /(19|20)\d{2}/i, message: "doit être un nombre à 4 chiffres" }
  validate :custom

  def titleize_title
    self.title = title.titleize
    self.location = location.titleize
  end

  def custom
    unless self.current
      if  self.end_time.blank? || (self.end_time.present? && end_time !~ /(19|20)\d{2}/i)
        errors.add(:end_time, "doit être un nombre à 4 chiffres")
      end
    end
  end

end
