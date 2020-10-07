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

      unless student.parsing
        student.school_experiences.destroy_all
        student.work_experiences.destroy_all
        create_schools(profil_json, student)
        create_companies(profil_json, student)
        student.parsing = true
      end

    end
  end

  private

  def create_schools(profil_json, student)
    profil_json['schools'].each do |school_json|
      school = School.find_or_create_by(name: school_json['schoolName']) { |s| s.linkedin_url = school_json['schoolUrl'] }
      create_school_experiences(school_json, student, school)
    end
  end

  def create_school_experiences(school_json, student, school)

    school_experience = SchoolExperience.create!(
      title: school_json['degree'],
      start_time: only_year(school_json['dateRange'].split(' – ')[0]),
      end_time: only_year(school_json['dateRange'].split(' – ')[1]),
      user: student, # a creer dans le model pour ne pas avoir a util user
      school: school
    )
    school_experience.update!(current: true) if school_experience.end_time.include?("Ajourd'hui" || 'Present')
  end

  def create_companies(profil_json, student)
    profil_json['jobs'].each do |company_json|
      company = Company.find_or_create_by(name: company_json['companyName']) { |c| c.linkedin_url = company_json['companyUrl'] }
      create_work_experience(company_json, student, company)
    end
  end

  def create_work_experience(company_json, student, company)
    work_experience = WorkExperience.create!(
      title: company_json['jobTitle'],
      start_time: only_year(company_json['dateRange'].split(' – ')[0]),
      end_time: only_year(company_json['dateRange'].split(' – ')[1]),
      location: company_json['location'],
      user: student, # a creer dans le model pour ne pas avoir a util user
      company: company
    )
    work_experience.update!(current: true) if work_experience.end_time.include?("Ajourd'hui" || 'Present')
  end


  def only_year(date)
    array = date.split(' ')
    integerDate = array.last
    return integerDate
  end
end




