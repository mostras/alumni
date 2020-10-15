class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.search(params)
  end
end
