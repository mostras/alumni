module Admin::StatisticsHelper

  def registered_user
    User.all.count
  end

  def last_day_registered_user
    start_date = DateTime.now
    end_date = start_date - 24.hour
    User.where(created_at: end_date..start_date).count
  end

  def visit_last_day
    start_date = DateTime.now
    end_date = start_date - 24.hour
    Visit.where(created_at: end_date..start_date).count
  end

  def users_looking_for_job
    User.where(looking_for_job: true).count
  end

  def hiring_companies_sum
    Company.includes(:users).where(users: {company_hire: true}).count
  end

  def top_sector
    hash_sectors = Hash.new(0)
    UserSector.all.each do |user_sector|
      hash_sectors[user_sector.sector.name] += 1.fdiv(UserSector.all.count)
    end

    hash_sectors.sort_by{|k, v| v}.reverse!

    answer = []
    hash_sectors.first(3).each do |k, v|
      answer << [k, v.round(2)*100 ]
    end
    answer
  end

  def top_city
    current_work_experiences = WorkExperience.where(current: true)

    hash_cities = Hash.new(0)
    current_work_experiences.each do |work_experience|
      hash_cities[work_experience.location] += 1.fdiv(current_work_experiences.size)
    end

    hash_cities.sort_by{|k, v| v}.reverse!

    answer = []

    hash_cities.first(3).each do |k, v|
      answer << [k, v.round(2)*100]
    end

    answer
  end
end
































