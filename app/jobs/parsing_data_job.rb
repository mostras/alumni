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
    @linkedin_json = JSON.parse(file)
    puts @linkedin_json
    companies_creation(@linkedin_json)
    schools_creation(@linkedin_json)
  end

  def companies_creation(linkedin_json)
    linkedin_json.each do |profil|
      user = User.find_by(linkedin_url: profil["general"]["profileUrl"])
      profil['jobs'].each do |j|
        company = Company.create!(name: j["companyName"], linkedin_url: j["companyUrl"]) unless Company.where(name: j["companyName"])
        puts company
        create_job(j, company, linkedin_json, user)
      end
    end
  end

  def schools_creation(linkedin_json)
    linkedin_json.each do |profil|
      user = User.find_by linkedin_url: profil["general"]["profileUrl"]
      profil["schools"] do |s|
        school = School.create!(name: s["schoolName"], school_url: s["schoolUrl"]) unless School.where(name: s["schoolName"])
        puts school
        create_diploma(s, school, linkedin_json, user)
      end
    end
  end

  def create_job(j, company, linkedin_json, user)
    date = j["dateRange"].split(' ')
    job = Job.create!(title: j["jobTitle"], location: j["location"], user_id: 2, company_id: 1)
    job.update!(current: true) if diploma.end_time == "Ajourd'hui"
  end

  def create_diploma(s, school, linkedin_json, user)
    date = s["dateRange"].split(' ')
    diploma = Diploma.create!(title: s["degree"], user_id: 2, school_id: 1)
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


