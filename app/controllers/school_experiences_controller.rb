class SchoolExperiencesController < ApplicationController

  before_action :set_user, only: [:new, :create]
  before_action :set_school_experience, only: [:edit, :update, :destroy]

  def new
    @school_experience = @user.school_experiences.build
    @school_experience.build_school
    @schools = School.pluck(:name)
  end

  def create
    school_name = params[:school_experience][:school_attributes][:name]

    @school = School.where('lower(name) = ?', school_name.downcase).first_or_create(name: school_name)
    @school_experience = @user.school_experiences.build(school_params)
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
    school_name = params[:school_experience][:school_attributes][:name]

    if @school_experience.school.name.downcase != school_name.downcase
      school = School.where('lower(name) = ?', school_name.downcase).first_or_create(name: school_name)
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
    params.require(:school_experience).permit(:title, :start_time, :end_time, :location, :current, schools_attributes: [:name])
  end
end
