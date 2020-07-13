require 'json'
require 'open-uri'
require "awesome_print"

class ParsingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    json_parsing
  end

  def json_parsing
    url = 'https://cache1.phantombooster.com/0EDS6xYcCEc/nydE5vIRxEvMrTH8otC9hw/test.json'
    file = open(url).read
    linkedin_json = JSON.parse(file)
    companies_creation(linkedin_json)
    schools_creation(linkedin_json)
  end

  def companies_creation(linkedin_json)
    linkedin_json.each do |profil|
      profil['jobs'].each do |j|
        company = Company.create!(name: j["companyName"], linkedin_url: j["companyUrl"]) unless Company.where(name: j["companyName"])
        create_job(j, company)
      end
    end
  end

  def schools_creation(linkedin_json)
    linkedin_json.each do |profil|
      profil["schools"] do |s|
        school = School.create!(name: s["schoolName"], school_url: s["schoolUrl"]) unless School.where(name: s["schoolName"])
        create_diploma(s, school)
      end
    end
  end

  def create_job(j, company)
    user = User.find_by linkedin_url: @linkedin_json["general"]["profileUrl"]
    date = j["dateRange"].split(' ')
    job = Job.create!(title: j["jobTitle"], start_time: `#{date[0]} #{date[1]}`, end_time: `#{date[3]} #{date[4]}`, location: j["location"], user_id: user.id, company_id: company.id)
    job.update!(current: true) if diploma.end_time == "Ajourd'hui"
  end

  def create_diploma(s, school)
    user = User.find_by linkedin_url: @linkedin_json["general"]["profileUrl"]
    date = s["dateRange"].split(' ')
    diploma = Diploma.create!(title: s["degree"], start_time: date[0], end_time: date[1], user_id: user.id, school_id: school.id)
    diploma.update!(current: true) if diploma.end_time == "Ajourd'hui"
  end

#   def create
#   json = JSON.parse() #en gros ici il faut recuperer le json avec toutes les infos
#   student = Student.create!(student_params)
#   create_schools_and_diplomas(json, student)
#   create_companies_and_jobs(json, student)
# end

# def create_schools_and_diplomas(json, student)
#   json[schools].each do |school|
#     School.create!(name: school_name, linkedin_url: school_url) unless School.where(name: school.schoolName)
#     create_diploma(school, student)
#   end
# end

# def create_companies_and_jobs(json, student)
#   json[jobs].each do |company|
#     Company.create!(name: company_name, linkedin_url: company_url) unless Company.where(name: company.companyName)
#     # il faudra aussi enrrichir la company apres coup
#     create_job(company, student)
#   end
# end

# def create_diploma(school, student)
#   diploma = Diploma.create!(
#     diploma_title: school.degree,
#     start_time: school.dateRange.split(' - ')[0],
#     end_time: school.dateRange.split(' - ')[1],
#     student: student,
#     school: school
#   )

#   diploma.update!(current: true) if diploma.end_time == "Ajourd'hui"
# end

# def create_job(company, student)
#   job = Job.create!(
#     job_title: company.jobTitle,
#     start_time: company.dateRange.split(' - ')[0],
#     end_time: company.dateRange.split(' - ')[1],
#     location: company.location,
#     student: student,
#     company: company
#   )

#   job.update!(current: true) if job.end_time == "Ajourd'hui"
# end


end
