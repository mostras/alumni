class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @schools = School.search(params)
  end

  def show
    @school = School.find(params[:id])
    schools = SchoolExperience.where(school: @school)
    @former_schools = schools.where(current: false)
    @current_schools = schools.where(current: true)
  end
end
