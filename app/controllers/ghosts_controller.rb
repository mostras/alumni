class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.all
  end
end
