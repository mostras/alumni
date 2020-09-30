class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @companies = Company.search(params)
  end

  def show
    @company = Company.find(params[:id])
    jobs = WorkExperience.where(company: @company)
    @former_jobs = jobs.where(current: false)
    @current_jobs = jobs.where(current: true)
    @hiring = @current_jobs.select { |job| job.user.company_hire == true }
  end
end
