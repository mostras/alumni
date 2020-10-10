class SchoolExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :school
  accepts_nested_attributes_for :school

  before_create :titleize_title
  before_validation :is_current

  validates :title, presence: true
  validates :start_time, presence: true, format: { with: /(19|20)\d{2}/i, message: "doit être un nombre à 4 chiffres" }
  validate :custom

  def titleize_title
    self.title = title.titleize
  end

  def is_current
    if self.end_time == "Aujourd'hui" || self.end_time == "Present" || self.current == true
      self.end_time = "Aujourd'hui"
      self.current = true
    end
  end

  def custom
    unless current
      if end_time.present? && end_time !~ /(19|20)\d{2}/i
        errors.add(:end_time, "doit être un nombre à 4 chiffres")
      end
    end
  end
end
