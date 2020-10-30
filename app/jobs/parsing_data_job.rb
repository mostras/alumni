require 'json'
require 'open-uri'

class ParsingDataJob < ApplicationJob
  queue_as :parsing_data



  def perform(*args)
    dispatch_action(parsing_json)
  end

  def parsing_json
    url = 'https://cache1.phantombooster.com/0EDS6xYcCEc/81HwWcUcWT5WaSs6jd0Gxg/result.json'
    file = open(url).read
    linkedin_json = JSON.parse(file)
    linkedin_json.reverse! # so we can start by the new ones at the end
  end

  def dispatch_action(json)
    json.each do |profil_json|
      unless profil_json['error'] == 'Empty line'
        student = User.find_by(linkedin_url: profil_json['general']['profileUrl'])
        student.school_experiences.destroy_all
        student.work_experiences.destroy_all
        create_schools(profil_json, student)
        create_companies(profil_json, student)
        student.parsings.last.update(parse: true)
        delete_url(student)
      end

    end
  end

  private

  def create_schools(profil_json, student)
    unless profil_json['schools'].nil?
      profil_json['schools'].each do |school_json|
        school_name = school_json['schoolName'].nil? ? '' : school_json['schoolName']
        school = School.where('lower(name) = ?', school_name.downcase).first_or_create(name: school_name)
        school.update(linkedin_url: school_json['schoolUrl'].nil? ? '' : school_json['schoolUrl'])
        create_school_experiences(school_json, student, school)
      end
    end
  end

  def create_school_experiences(school_json, student, school)
    start_date = school_json['dateRange'].nil? ? '' : school_json['dateRange'].split(' – ').first
    end_date = school_json['dateRange'].nil? ? '' : school_json['dateRange'].split(' – ').last

    school_experience = SchoolExperience.create!(
      title: school_json['degree'].nil? ? '' : school_json['degree'],
      start_time: only_year(start_date),
      end_time: only_year(end_date),
      user: student, # a creer dans le model pour ne pas avoir a util user
      school: school
    )
    # school_experience.update!(current: true) if school_experience.end_time.include?("Ajourd'hui" || 'Present')
  end

  def create_companies(profil_json, student)
    unless profil_json['jobs'].nil?
      profil_json['jobs'].each do |company_json|
        company_name = company_json['companyName'].nil? ? '' : company_json['companyName']
        company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name)
        company.update(linkedin_url: company_json['companyUrl'].nil? ? '' : company_json['companyUrl'])
        create_work_experience(company_json, student, company)
      end
    end
  end

  def create_work_experience(company_json, student, company)
    work_experience = WorkExperience.create!(
      title: company_json['jobTitle'],
      start_time: only_year(company_json['dateRange'].split(' – ').first),
      end_time: only_year(company_json['dateRange'].split(' – ').last),
      location: company_json['location'].nil? ? '' : company_json['location'],
      user: student, # a creer dans le model pour ne pas avoir a util user
      company: company
    )
    # work_experience.update!(current: true) if work_experience.end_time.include?("Ajourd'hui" || 'Present')
  end

  def only_year(date)
    if date == ''
      return ''
    else
      array = date.split(' ')
      integerDate = array.last
      return integerDate
    end
  end

  def delete_url(student)
    cell = student.id
    session = GoogleDrive::Session.from_service_account_key("client-secret.json")
    spreadsheet = session.spreadsheet_by_title("url_linkedin_app_alumni")
    worksheet = spreadsheet.worksheets.first
    worksheet["A#{cell}"] = ''

    worksheet.save
  end
end




