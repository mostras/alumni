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

  def hiring?(company)
    jobs = WorkExperience.where(company: company)
    current_jobs = jobs.where(current: true)
    hirings = current_jobs.select { |job| job.user.company_hire == true }
    hirings.any?
  end

  def hiring_companies(companies)
    number = []
    companies.each do |company|
      number << hiring?(company)
    end
    number.count(true)
  end

  def hiring_color(company)
    if hiring?(company) == true
      return 'hiring-border'
    end
  end
end
