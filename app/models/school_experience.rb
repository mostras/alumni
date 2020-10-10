class SchoolExperience < ApplicationRecord
  include CurrentExp

  belongs_to :user
  belongs_to :school
  accepts_nested_attributes_for :school

  before_create :titleize_title

  validates :title, presence: true
  validates :start_time, presence: true, format: { with: /(19|20)\d{2}/i, message: "doit être un nombre à 4 chiffres" }
  validates :end_time, allow_blank: true,  format: { with: /(19|20)\d{2}/i, message: "doit être un nombre à 4 chiffres" }

  def titleize_title
    self.title = title.titleize
  end
end
