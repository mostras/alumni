module CompaniesFormHelper

  def city_list
    list = []
    companies = Company.all
    companies.each do |company|
      list << [company.city.try(:capitalize), company.city.try(:downcase)]
    end

    city_list = list.uniq
    return city_list
  end

  def hiring_companies(companies)
    companies_list = []
    companies.each do |company|
      companies_list << company if company.recruitments.any?
    end

    return companies_list.count
  end

  def hiring?(company)
    hirings = Recruitment.where(company: company)
    hirings.any?
  end

  def hiring_color(company)
    if hiring?(company) == true
      return 'hiring-border'
    end
  end
end
