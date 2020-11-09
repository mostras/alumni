class Admin::PagesController < Admin::ApplicationController

  def statistics
    @registered_user = User.all.count
    @last_day_registered_user = last_day_registered_user_sum
    @visit_since_last_day = GoogleAnalytics.new.number_session_calculation
    @session_duration = GoogleAnalytics.new.session_duration_calculation
    @users_looking_for_job = User.where(looking_for_job: true).count
    @hiring_companies = Recruitment.all.pluck(:company_id).uniq.count
    @top_sector = top_sector_func
    @top_city = top_city_func
  end

  def emails
  end


  private

  def last_day_registered_user_sum
    start_date = DateTime.now
    end_date = start_date - 24.hour
    User.where(created_at: end_date..start_date).count
  end

  def top_sector_func
    hash_sectors = Hash.new(0)
    UserSector.all.each do |user_sector|
      hash_sectors[user_sector.sector.name] += 1.fdiv(UserSector.all.count)
    end

    hash_sectors_sort = hash_sectors.sort_by{|k, v| v}.reverse!

    answer = []
    hash_sectors_sort.first(5).each do |k, v|
      answer << [k, (v*100).round ]
    end
    answer
  end

  def top_city_func
    current_work_experiences = WorkExperience.where(current: true)

    hash_cities = Hash.new(0)
    current_work_experiences.each do |work_experience|
      hash_cities[work_experience.location] += 1.fdiv(current_work_experiences.size)
    end



    hash_cities_sort = hash_cities.sort_by{|k, v| v}.reverse

    answer = []

    hash_cities_sort.first(5).each do |k, v|
      answer << [k, (v*100).round]
    end

    return answer
  end

end
