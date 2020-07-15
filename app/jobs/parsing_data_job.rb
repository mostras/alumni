def perform(*args)
  dispatch_action(parsing_json)
end

def parsing_json
  url = 'https://cache1.phantombooster.com/0EDS6xYcCEc/nydE5vIRxEvMrTH8otC9hw/test.json'
  file = open(url).read
  linkedin_json = JSON.parse(file)
  linkedin_json.reverse! # so we can start by the new ones at the end
end

def dispatch_action(json)
  json.each do |profil|
    student = User.find_by(linkedin_url: profil['general']['profileUrl'])

    if student.jobs && student.diplomas # checking if the student already exists (if his profile is completed already)
      update_schools(profil, student)
      update_jobs(profil, student)
    else
      create_schools(profil, student) # pas encore fait
      create_companies(profil, student) # pas encore fait
    end
  end
end

private

def create_schools(profil, student)
  profil[schools].each do |school|
    unless School.where(name: school['schoolName'])
      new_school = School.create!(
        name: school['schoolName'],
        linkedin_url: school['school_url']
      )
    end
    create_diploma(new_school, student)
  end
end

def create_diploma(school, student)
  diploma = Diploma.create!(
    title: school['degree'],
    start_time: school['dateRange'].split(' - ')[0],
    end_time: school['dateRange'].split(' - ')[1],
    student: student,
    school: school # a creer dans le model pour ne pas avoir a util user
  )
  diploma.update!(current: true) if diploma.end_time.include?("Ajourd'hui" || 'Present')
end

def create_companies(profil, student)
  profil[jobs].each do |company|
    unless Company.where(name: company['companyName'])
      new_company = Company.create!(
        name: company['companyName'],
        linkedin_url: company['companyUrl']
      )
    end
    create_job(new_company, student)
  end
end

def create_job(company, student)
  job = Job.create!(
    job_title: company['jobTitle'],
    start_time: company['dateRange'].split(' - ')[0],
    end_time: company['dateRange'].split(' - ')[1],
    location: company['location'],
    student: student, # a creer dans le model pour ne pas avoir a util user
    company: company
  )

  job.update!(current: true) if job.end_time.include?("Ajourd'hui" || 'Present')
end

# require 'json'
# require 'open-uri'
# require "awesome_print"

# class ParsingDataJob < ApplicationJob
#   queue_as :parsing_data

#   def perform(*args)
#     json_parsing
#   end

#   def json_parsing
#     url = 'https://cache1.phantombooster.com/0EDS6xYcCEc/nydE5vIRxEvMrTH8otC9hw/test.json'
#     file = open(url).read
#     @linkedin_json = JSON.parse(file)
#     companies_creation(@linkedin_json)
#     schools_creation(@linkedin_json)
#   end

#   def companies_creation(linkedin_json)
#     linkedin_json.each do |profil|
#       user = User.find_by(linkedin_url: profil["general"]["profileUrl"]) #ne doit pas être ici
#       profil['jobs'].each do |j|
#         if Company.find_by(name: j["companyName"]) == nil
#           company = Company.create!(name: j["companyName"], linkedin_url: j["companyUrl"])
#         end
#         create_job(j, user, company)
#       end
#     end
#   end

#   def schools_creation(linkedin_json)
#     linkedin_json.each do |profil|
#       user = User.find_by(linkedin_url: profil["general"]["profileUrl"]) #ne doit pas être ici
#       profil["schools"].each do |s|
#         if School.find_by(name: s["schoolName"]) == nil
#           school = School.create!(name: s["schoolName"], school_url: s["schoolUrl"])
#         end
#         create_diploma(s, user, profil)
#       end
#     end
#   end

#   def create_job(j, user, company)
#     date = j["dateRange"].split(' ')
#     company = Company.find_by(name: j["companyName"]) if company == nil
#     job = Job.create!(title: j["jobTitle"], start_time: "#{date[0]} #{date[1]}", end_time: "#{date[3]} #{date[4]}", location: j["location"], user_id: user.id, company_id: company.id)
#     ap job.end_time
#     if job.end_time.include? "Ajourd'hui" || "Present"
#       job.update!(current: true)
#     else
#       job.update!(current: false)
#     end
#   end

#   def create_diploma(s, user, profil)
#     date = s["dateRange"].split(' ')
#     school = School.find_by(name: s["schoolName"]) if school == nil
#     diploma = Diploma.create!(title: s["degree"], start_time: date[0], end_time: date[2], user_id: user.id, school_id: school.id)
#     if diploma.end_time.include? "Ajourd'hui" || "Present"
#       diploma.update!(current: true)
#     else
#       diploma.update!(current: false)
#     end
#   end
# end


