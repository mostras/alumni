class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :edit_situation]


  def index
    @students = User.search(params)
    @diplomas = Diploma.all
    @sectors = Sector.all
  end

  def show
  end

  def edit
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

  def edit_situation
  end

  def linkedin
  end

  def submit_url_linkedin
    id = current_user.id
    linkedin_url = params[:url]
    current_user.update(linkedin_url: linkedin_url)
    AddUrl.new(id, linkedin_url).google_sheet
    redirect_to tag_creation_tags_path
  end

  def welcome
  end

  private

  def set_user
    @student = User.find(params[:id])
  end

  def student_params
    params.require(:user).permit(:linkedin_url, :email, :phone_number, :whatsapp_number, :looking_for_job, :looking_for_internship, :company_hire, :photo)
  end


end
