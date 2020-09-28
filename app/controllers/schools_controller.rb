class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end
end
