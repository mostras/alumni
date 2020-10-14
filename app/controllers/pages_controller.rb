class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def linkedin
  end

  def welcome
  end
end
