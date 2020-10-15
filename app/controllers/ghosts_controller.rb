class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.search(params)
  end

  def send_invite
    ghost = Ghost.find(params[:id])
    user = current_user
    UserMailer.with(ghost: ghost, user: user).send_invitation.deliver_now
  end
end
