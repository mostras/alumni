class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]


  def index
    @students = User.all
  end

  def show
  end

  def edit
    @diplomas = Diploma.all
    @tag = @student.tags.build
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Vos modifications ont été enregistrées."
      redirect_to user_path(@student)
    else
      flash[:alert] = "Vos modifications n'ont pas pu être enregistrées."
      render :edit
    end
  end

  def linkedin
  end

  private

  def set_user
    @student = User.find(params[:id])
  end

  def student_params
    params.require(:user).permit(:linkedin_url, :email, :phone_number, :whatsapp_url, :looking_for_job, :company_hire, :photo)
  end


end
