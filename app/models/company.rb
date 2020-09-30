class Company < ApplicationRecord
  has_many :work_experiences, dependent: :destroy
  has_many :users, through: :work_experiences

  has_one_attached :photo

  def self.search(params)
    companies = Company.all

    if params[:city].present?
      company_city = params[:city].titleize
      companies = Company.where('city LIKE ?', "%#{company_city}%")
    end

    if params[:name].present?
      company_name = params[:name].titleize
      companies = Company.where('name LIKE ?', "%#{company_name}%")
    end

    return companies
  end
end
