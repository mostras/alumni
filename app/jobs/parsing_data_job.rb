require 'json'
require 'open-uri'

class ParsingDataJob < ApplicationJob
  queue_as :parsing_data

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
    json.each do |profil_json|
      student = User.find_by(linkedin_url: profil_json['general']['profileUrl'])

      # if student.jobs && student.diplomas # checking if the student already exists (if his profile is completed already)
      #   # update_schools(profil, student) # pas encore fait
      #   # update_jobs(profil, student) # pas encore fait
      # else
      create_schools(profil_json, student)
      create_companies(profil_json, student)
      # end
    end
  end

  private

  def create_schools(profil_json, student)
    profil_json['schools'].each do |school_json|
      if School.find_by(name: school_json['schoolName'])
        school = School.find_by(name: school_json['schoolName'])
      else
        school = School.create!(
          name: school_json['schoolName'],
          school_url: school_json['schoolUrl']
        )
      end
      create_diploma(school_json, student, school)
    end
  end

  def create_diploma(school_json, student, school)
    diploma = Diploma.create!(
      title: school_json['degree'],
      start_time: school_json['dateRange'].split(' – ')[0],
      end_time: school_json['dateRange'].split(' – ')[1],
      user: student, # a creer dans le model pour ne pas avoir a util user
      school: school
    )
    diploma.update!(current: true) if diploma.end_time.include?("Ajourd'hui" || 'Present')
  end

  def create_companies(profil_json, student)
    profil_json['jobs'].each do |company_json|
      if Company.find_by(name: company_json['companyName'])
        company = Company.find_by(name: company_json['companyName'])
      else
        company = Company.create!(
          name: company_json['companyName'],
          linkedin_url: company_json['companyUrl']
        )
      end
      create_job(company_json, student, company)
    end
  end

  def create_job(company_json, student, company)
    job = Job.create!(
      title: company_json['jobTitle'],
      start_time: company_json['dateRange'].split(' – ')[0],
      end_time: company_json['dateRange'].split(' – ')[1],
      location: company_json['location'],
      user: student, # a creer dans le model pour ne pas avoir a util user
      company: company
    )

    job.update!(current: true) if job.end_time.include?("Ajourd'hui" || 'Present')
  end
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
#       user = User.find_by(linkedin_url: profil['general']['profileUrl']) #ne doit pas être ici
#       profil['jobs'].each do |j|
#         if Company.find_by(name: j['companyName']) == nil
#           company = Company.create!(name: j['companyName'], linkedin_url: j['companyUrl'])
#         end
#         create_job(j, user, company)
#       end
#     end
#   end

#   def schools_creation(linkedin_json)
#     linkedin_json.each do |profil|
#       user = User.find_by(linkedin_url: profil['general']['profileUrl']) #ne doit pas être ici
#       profil['schools'].each do |s|
#         if School.find_by(name: s['schoolName']) == nil
#           school = School.create!(name: s['schoolName'], school_url: s['schoolUrl'])
#         end
#         create_diploma(s, user, profil)
#       end
#     end
#   end

#   def create_job(j, user, company)
#     date = j['dateRange'].split(' ')
#     company = Company.find_by(name: j['companyName']) if company.nil?
#     job = Job.create!(title: j['jobTitle'], start_time: '#{date[0]} #{date[1]}', end_time: '#{date[3]} #{date[4]}', location: j['location'], user_id: user.id, company_id: company.id)
#     ap job.end_time
#     if job.end_time.include? "Ajourd'hui" || 'Present'
#       job.update!(current: true)
#     else
#       job.update!(current: false)
#     end
#   end

#   def create_diploma(s, user, profil)
#     date = s['dateRange'].split(' ')
#     school = School.find_by(name: s['schoolName']) if school == nil
#     diploma = Diploma.create!(title: s['degree'], start_time: date[0], end_time: date[2], user_id: user.id, school_id: school.id)
#     if diploma.end_time.include? "Ajourd'hui" || 'Present'
#       diploma.update!(current: true)
#     else
#       diploma.update!(current: false)
#     end
#   end
# end


