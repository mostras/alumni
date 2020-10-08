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
    if params[:url].blank?
      current_user.update(manual_updating: true, automatic_updating: false)
    else
      linkedin_url = params[:url]
      current_user.update(linkedin_url: linkedin_url, automatic_updating: true, manual_updating: false)
      AddUrl.new(id, linkedin_url).google_sheet
    end
    redirect_to request.referrer
  end

  def welcome
  end

  def updating_profil_exp
  end

  def set_automatic_updating
    auto = current_user.automatic_updating
    manu = current_user.manual_updating
    current_user.update(automatic_updating: !auto, manual_updating: !manu)
    redirect_to request.referrer
  end

  def set_manual_updating
    auto = current_user.automatic_updating
    manu = current_user.manual_updating
    current_user.update(automatic_updating: !auto, manual_updating: !manu)
    redirect_to request.referrer
  end

  private

  def set_user
    @student = User.find(params[:id])
  end

  def student_params
    params.require(:user).permit(:linkedin_url, :email, :phone_number, :whatsapp_number, :looking_for_job, :looking_for_internship, :company_hire, :photo)
  end


end
