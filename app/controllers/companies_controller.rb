class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    jobs = WorkExperience.where(company: @company)
    @current_jobs = jobs.select { |job| job.current == true }
    @former_jobs = jobs.select { |job| job.current == false }
  end
end
