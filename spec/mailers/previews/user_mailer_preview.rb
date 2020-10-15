# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def send_invitation
    UserMailer.with(ghost: Ghost.first, user: User.first).send_invitation
  end
end
