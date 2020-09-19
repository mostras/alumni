class UserSectorsController < ApplicationController

  before_action :set_student, only: [:create]

  def new
  end

  def create
    @user_sector = @student.user_sectors.build(user_sector_params)
    if @user_sector.save
      flash[:notice] = "Le secteur a bien été ajouté."
      redirect_to edit_user_path(@student)
    else
      flash[:alert] = "Le secteur n'a pas pu être ajouté."
      render :new
    end
  end

  private

  def set_student
    @student = User.find(params[:user_id])
  end

  def user_sector_params
    params.require(:user_sector).permit(:sector_id)
  end
end
