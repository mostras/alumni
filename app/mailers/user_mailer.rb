class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_invitation
    @ghost = params[:ghost]
    @user = params[:user]
    @url  = 'http://localhost:3000'
    mail(to: @ghost.email, subject: 'Un alumni des Chartreux vous invite à rejoindre la plateforme !')
  end
end
