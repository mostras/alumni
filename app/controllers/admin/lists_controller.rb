class Admin::ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
  end

  def new
    @lists = List.all
    @list = List.new
    @students = User.search(params)
    @diplomas = Diploma.all
    @sectors = Sector.all
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to admin_lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, user_ids: [])
  end
end

