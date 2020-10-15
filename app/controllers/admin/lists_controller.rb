class Admin::ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
  end
end
