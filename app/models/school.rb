class School < ApplicationRecord
  has_many :school_experiences, dependent: :destroy
  has_many :users, through: :school_experiences

  has_one_attached :photo

  def self.search(params)
    schools = School.all

    if params[:city].present?
      school_city = params[:city].titleize
      schools = School.where('city LIKE ?', "%#{school_city}%")
    end

    if params[:name].present?
      school_name = params[:name].titleize
      schools = School.where('name LIKE ?', "%#{school_name}%")
    end

    return schools
  end
end

