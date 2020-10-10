class School < ApplicationRecord
  has_many :school_experiences, dependent: :destroy
  has_many :users, through: :school_experiences
  has_one_attached :photo

  before_create :titleize_name

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name,
  using: {
    tsearch: { prefix: true }
  }

  def self.search(params)
    schools = School.all

    if params[:city].present?
      school_city = params[:city].titleize
      schools = School.where('city LIKE ?', "%#{school_city}%")
    end

    schools = School.search_by_name(params[:name]) if params[:name].present?


    return schools
  end


  def titleize_name
    self.name = name.downcase.titleize
  end
end

