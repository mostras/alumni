class ParsingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def create
  json = JSON.parse() #en gros ici il faut recuperer le json avec toutes les infos
  student = Student.create!(student_params)
  create_schools_and_diplomas(json, student)
  create_companies_and_jobs(json, student)
end

def create_schools_and_diplomas(json, student)
  json[schools].each do |school|
    School.create!(name: school_name, linkedin_url: school_url) unless School.where(name: school.schoolName)
    create_diploma(school, student)
  end
end

def create_companies_and_jobs(json, student)
  json[jobs].each do |company|
    Company.create!(name: company_name, linkedin_url: company_url) unless Company.where(name: company.companyName)
    # il faudra aussi enrrichir la company apres coup
    create_job(company, student)
  end
end

def create_diploma(school, student)
  diploma = Diploma.create!(
    diploma_title: school.degree,
    start_time: school.dateRange.split(' - ')[0],
    end_time: school.dateRange.split(' - ')[1],
    student: student,
    school: school
  )

  diploma.update!(current: true) if diploma.end_time == "Ajourd'hui"
end

def create_job(company, student)
  job = Job.create!(
    job_title: company.jobTitle,
    start_time: company.dateRange.split(' - ')[0],
    end_time: company.dateRange.split(' - ')[1],
    location: company.location,
    student: student,
    company: company
  )

  job.update!(current: true) if job.end_time == "Ajourd'hui"
end

private

def student_params
  parmas.require(students).permit(:first_name, :last_name, :phone_number, :email, :title, :description, :linkedin_url, :city, :promo)
end
end
