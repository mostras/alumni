class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @companies = Company.all
  end
end
