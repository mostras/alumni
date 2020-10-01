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
          linkedin_url: school_json['schoolUrl']
        )
      end
      create_school_experiences(school_json, student, school)
    end
  end

  def create_school_experiences(school_json, student, school)
    school_experience = SchoolExperience.create!(
      title: school_json['degree'],
      start_time: school_json['dateRange'].split(' – ')[0],
      end_time: school_json['dateRange'].split(' – ')[1],
      user: student, # a creer dans le model pour ne pas avoir a util user
      school: school
    )
    school_experience.update!(current: true) if school_experience.end_time.include?("Ajourd'hui" || 'Present')
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
      create_work_experience(company_json, student, company)
    end
  end

  def create_work_experience(company_json, student, company)
    work_experience = WorkExperience.create!(
      title: company_json['jobTitle'],
      start_time: company_json['dateRange'].split(' – ')[0],
      end_time: company_json['dateRange'].split(' – ')[1],
      location: company_json['location'],
      user: student, # a creer dans le model pour ne pas avoir a util user
      company: company
    )

    work_experience.update!(current: true) if work_experience.end_time.include?("Ajourd'hui" || 'Present')
  end
end




