class Company < ApplicationRecord
  has_many :work_experiences, dependent: :destroy
  has_many :users, through: :work_experiences
  has_one_attached :photo

  before_create :titleize_name

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name,
  using: {
    tsearch: { prefix: true }
  }

  def self.search(params)
    companies = Company.all

    if params[:city].present?
      company_city = params[:city].titleize
      companies = Company.where('city LIKE ?', "%#{company_city}%")
    end

    companies = Company.search_by_name(params[:name]) if params[:name].present?

    return companies
  end

  def titleize_name
    self.name = name.downcase.titleize
  end
end
