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
    sectors = []

    UserSector.all.each do |user_sector|
      sectors << user_sector.sector.name
    end

    sector_hash= Hash.new(0)
    sectors.each do |sector|
      sector_hash[sector] += 1
    end

    sort_sector = sector_hash.sort_by{|k, v| v}.reverse

    best_sector = []

    sort_sector[0..2].each do |h|
      best_sector << h[0]
    end

    "#{best_sector[0]}, #{best_sector[1]} et #{best_sector[2]}"
  end
end



