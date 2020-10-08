class WorkExperiencesController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_work_experiences, only: [:edit, :update]

  def new
    @work_experience = @user.work_experiences.build
  end

  def create
    @work_experience = @user.work_experiences.build(work_experiences_params)

    if @work_experience.save
      flash[:notice] = 'Votre expérience a bien été ajoutée.'
      redirect_to updating_profil_exp_user_path
    else
      flash[:alert] = "Votre expérience n'a pas pu être ajoutée"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = current_user
  end

  def set_work_experiences
    @work_experience = WorkExperiences.find(params[:id])
  end

  def work_experiences_params
    params.require(:work_experiences).permit(:title, :start_time, :end_time, :location, :current, :company_id)
  end
end
