class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.search(params).order(last_name: :asc)
  end

  def send_invite
    ghost = Ghost.find(params[:id])
    send_mail_to_ghost(ghost)
    ghost.update(notification_send: true)
    flash[:notice] = "Une invitation à bien été envoyé à #{ghost.full_name}."
    redirect_to request.referrer
  end


  private

  def send_mail_to_ghost(ghost)
    user = current_user
    UserMailer.with(ghost: ghost, user: user).send_invitation.deliver_now
  end
end
