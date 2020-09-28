class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end
end
