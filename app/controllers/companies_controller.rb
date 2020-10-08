class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @companies = Company.search(params)
  end

  def show
    @company = Company.find(params[:id])
    jobs = WorkExperience.where(company: @company.id)
    @current_jobs = jobs.where(current: true).select(:user_id).distinct
    @former_jobs = jobs.where(current: false).select(:user_id).distinct

    @hiring = @current_jobs.select { |job| job.user.company_hire == true }
    # @only_current_jobs = current_jobs - @hiring
  end
end
