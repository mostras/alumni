class SchoolExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :school
  accepts_nested_attributes_for :school

  before_create :titleize_title
  before_validation :is_current

  validate :custom_start_time
  validate :custom_end_time

  def titleize_title
    self.title = title.titleize
  end

  def is_current
    if self.end_time == "Aujourd'hui" || self.end_time == "Present" || self.current == true
      self.end_time = "Aujourd'hui"
      self.current = true
    end
  end

  def custom_end_time
    unless self.current
      if self.end_time.present? && !self.end_time.blank? && self.end_time !~ /(19|20)\d{2}/i
        errors.add(:end_time, "doit être un nombre à 4 chiffres")
      end
    end
  end

  def custom_start_time
    if self.start_time.present? && !self.start_time.blank? && self.start_time !~ /(19|20)\d{2}/i
      errors.add(:start_time, "doit être un nombre à 4 chiffres")
    end
  end
end
