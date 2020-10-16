class Admin::ListsController < ApplicationController

  before_action :set_list, only: [:edit, :update, :destroy]

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
      redirect_to admin_list_path(@list)
      flash[:notice] = "La liste #{@list.name} a bien été créée."
    else
      render :new
      flash[:alert] = "La liste n'a pas pu être créée"
    end
  end

  def edit
    @lists = List.all
    @students = User.search(params)
    @diplomas = Diploma.all
    @sectors = Sector.all
  end

  def update
    if @list.update(list_params)
      redirect_to admin_list_path(@list)
      flash[:notice] = "La liste #{@list.name} a bien été modifiée."
    else
      render :edit
      flash[:alert] = "La liste n'a pas pu être modifiée"
    end
  end

  def destroy
    @list.destroy
    redirect_to admin_lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, user_ids: [])
  end
end

