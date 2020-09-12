class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]


  def index
    @students = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Modifié"
      redirect_to user_path(@student)
    else
      flash[:alert] = "Non modifié"
      render :edit
    end
  end

  private

  def set_user
    @student = User.find(params[:id])
  end

  def student_params
    params.require(:user).permit(:linkedin_url, :email, :phone_number, :whatsapp_url, :messenger_url, :instagram_url, :looking_for_job, :company_hire)
  end


end
