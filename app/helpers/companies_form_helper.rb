module CompaniesFormHelper

  def city_list
    list = []
    companies = Company.all
    companies.each do |company|
      list << [company.city.capitalize, company.city.downcase]
    end

    city_list = list.uniq
    return city_list
  end

  def hiring_companies(companies)
    hiring_companies_list = companies.includes(:users).where(users: {company_hire: true})
    return hiring_companies_list.count
  end
end
