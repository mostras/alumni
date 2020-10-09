class SchoolExperiencesController < ApplicationController

  before_action :set_user, only: [:new, :create]
  before_action :set_school_experience, only: [:edit, :update, :destroy]

  def new
    @school_experience = @user.school.build
  end

  def create
    @school = School.find_or_create_by(name: params[:school_experience][:school])
    @school_experience = @user.school.build(school_params)
    @school_experience.school = @school

    if @school_experience.save
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

    if @school_experience.school.name != params[:school_experience][:school]
      school = School.find_or_create_by(name: params[:school_experience][:school])
      @school_experience.school = school
    end

    if @school_experience.update(school_params)
      flash[:notice] = 'Votre expérience a bien été modifiée.'
      redirect_to updating_profil_exp_user_path(current_user)
    else
      flash[:alert] = "Votre expérience n'a pas pu être modifiée"
      render :new
    end
  end

  def destroy
    @school_experience.destroy
    redirect_to request.referrer
  end

  private

  def set_user
    @user = current_user
  end

  def set_school_experience
    @school_experience = SchoolExperience.find(params[:id])
  end

  def school_params
    params.require(:school_experience).permit(:title, :start_time, :end_time, :location, :current, schools_attributes: [:school])
  end
end
