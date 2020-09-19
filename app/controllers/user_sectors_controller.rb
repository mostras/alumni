class UserSectorsController < ApplicationController

  before_action :set_student, only: [:new, :create, :edit]
  before_action :set_user_sector, only: [:edit]

  def new
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def create
    @user_sector = @student.user_sectors.build(user_sector_params)
    if @user_sector.save
      flash[:notice] = "Le secteur a bien été ajouté."
      redirect_to new_user_user_sector_path(@student)
    else
      flash[:alert] = "Le secteur n'a pas pu être ajouté."
      render :new
    end
  end

  def edit
  end

  private

  def set_student
    @student = current_user
  end

  def set_user_sector
    @user_sector = UserSector.find(params[:id])
  end

  def user_sector_params
    params.require(:user_sector).permit(:sector_id)
  end
end
