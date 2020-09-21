class UserSectorsController < ApplicationController

  before_action :set_student, only: [:index, :new, :create, :edit]
  before_action :set_user_sector, only: [:edit, :destroy]

  def index
    @user_sectors = UserSector.where(user: @student)
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def new
    @sectors = Sector.all
    @user_sector = @student.user_sectors.build
  end

  def create
    unless @student.user_sectors.size >= 5
      @user_sector = @student.user_sectors.build(user_sector_params)
      if @user_sector.save
        flash[:notice] = "Le secteur a bien été ajouté."
        redirect_to request.referrer
      else
        flash[:alert] = "Le secteur n'a pas pu être ajouté."
        render :new
      end
    else
      @user_sector = @student.user_sectors.build
      @sectors = Sector.all
      flash[:alert] = "Le secteur n'a pas pu être ajouté."
      render :new
    end
  end

  def edit
  end

  def destroy
    @user_sector.destroy
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
