require 'json'
require 'open-uri'
require "awesome_print"

class ParsingDataJob < ApplicationJob
  queue_as :parsing_data

  def perform(*args)
    json_parsing
  end

  def json_parsing
    url = 'https://cache1.phantombooster.com/0EDS6xYcCEc/nydE5vIRxEvMrTH8otC9hw/test.json'
    file = open(url).read
    @linkedin_json = JSON.parse(file)
    companies_creation(@linkedin_json)
    schools_creation(@linkedin_json)
  end

  def companies_creation(linkedin_json)
    linkedin_json.each do |profil|
      user = User.find_by(linkedin_url: profil["general"]["profileUrl"])
      profil['jobs'].each do |j|
        if Company.find_by(name: j["companyName"]) == nil
          company = Company.create!(name: j["companyName"], linkedin_url: j["companyUrl"])
        end
        create_job(j, user, company)
      end
    end
  end

  def schools_creation(linkedin_json)
    linkedin_json.each do |profil|
      user = User.find_by(linkedin_url: profil["general"]["profileUrl"])
      profil["schools"].each do |s|
        if School.find_by(name: s["schoolName"]) == nil
          school = School.create!(name: s["schoolName"], school_url: s["schoolUrl"])
        end
        create_diploma(s, user, profil)
      end
    end
  end

  def create_job(j, user, company)
    date = j["dateRange"].split(' ')
    company = Company.find_by(name: j["companyName"]) if company == nil
    job = Job.create!(title: j["jobTitle"], start_time: "#{date[0]} #{date[1]}", end_time: "#{date[3]} #{date[4]}", location: j["location"], user_id: user.id, company_id: company.id)
    ap job.end_time
    if job.end_time.include? "Ajourd'hui" || "Present"
      job.update!(current: true)
    else
      job.update!(current: false)
    end
  end

  def create_diploma(s, user, profil)
    date = s["dateRange"].split(' ')
    school = School.find_by(name: s["schoolName"]) if school == nil
    diploma = Diploma.create!(title: s["degree"], start_time: date[0], end_time: date[2], user_id: user.id, school_id: school.id)
    if diploma.end_time.include? "Ajourd'hui" || "Present"
      diploma.update!(current: true)
    else
      diploma.update!(current: false)
    end
  end
end


