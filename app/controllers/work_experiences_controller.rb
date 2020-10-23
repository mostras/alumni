class WorkExperiencesController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_work_experiences, only: [:edit, :update, :destroy]

  def new
    @work_experience = @user.work_experiences.build
    @work_experience.build_company
    @companies = Company.pluck(:name)
  end

  def create
    company_name = params[:work_experience][:company_attributes][:name]
    @company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name)
    @work_experience = @user.work_experiences.build(work_experiences_params)
    @work_experience.company = @company

    if @work_experience.save
      flash[:notice] = 'Votre expérience a bien été ajoutée.'
      redirect_to updating_profil_exp_user_path(current_user)
    else
      flash[:alert] = "Votre expérience n'a pas pu être ajoutée"
      render :new
    end
  end

  def edit
  end

  def update
    company_name = params[:work_experience][:company_attributes][:name]

    if @work_experience.company.name.downcase != company_name.downcase
      company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name)
      @work_experience.company = company
    end

    if @work_experience.update(work_experiences_params)
      flash[:notice] = 'Votre expérience a bien été modifiée.'
      redirect_to updating_profil_exp_user_path(current_user)
    else
      flash[:alert] = "Votre expérience n'a pas pu être modifiée"
      render :new
    end
  end

  def destroy
    @work_experience.destroy
    redirect_to request.referrer
  end

  private

  def set_user
    @user = current_user
  end

  def set_work_experiences
    @work_experience = WorkExperience.find(params[:id])
  end

  def work_experiences_params
    params.require(:work_experience).permit(:title, :start_time, :end_time, :location, :current, companies_attributes: [:name])
  end
end
