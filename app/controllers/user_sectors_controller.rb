class UserSectorsController < ApplicationController

  before_action :set_student, only: [:index, :sector_creation, :create, :edit]
  before_action :set_user_sector, only: [:edit, :destroy]

  def index
    @user_sectors = UserSector.where(user: @student)
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def sector_creation
    @user_sectors = UserSector.where(user: @student)
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def create
    @user_sector = @student.user_sectors.build(user_sector_params)
    if @user_sector.save
      flash[:notice] = "\"#{@user_sector.sector.name}\" a bien été ajouté à votre profil."
      redirect_to request.referrer
    else
      flash[:alert] = "Le secteur n'a pas pu être ajouté."
    end
  end

  def edit
  end

  def destroy
    @user_sector.destroy
    redirect_to request.referrer
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
