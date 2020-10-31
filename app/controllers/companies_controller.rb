class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: [:new, :create]

  def index
    @companies = Company.search(params)
  end

  def show
    @company = Company.find(params[:id])
    jobs = WorkExperience.where(company: @company.id)
    @current_jobs = jobs.where(current: true).select(:user_id).distinct
    @former_jobs = jobs.where(current: false).select(:user_id).distinct
    @hiring_user = User.includes(:recruitments).where(recruitments: { company: @company })
  end

  def new
    @company = Company.new
    @company.work_experiences.build
  end

  def create
    @company = Company.new(company_params)

    if @company.save!

      flash[:notice] = 'Votre expérience a bien été ajoutée.'
      redirect_to updating_profil_exp_user_path(current_user)
    else
      flash[:alert] = "Votre expérience n'a pas pu être ajoutée"
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def company_params
    params.require(:company).permit(:name, work_experiences_attributes: [:id, :user_id, :title, :start_time, :end_time, :location, :current])
  end
end
