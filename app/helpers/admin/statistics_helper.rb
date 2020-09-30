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
end



