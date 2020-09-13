class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  after_create :add_mail_to_google_sheet

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_mail_to_google_sheet
    AddMail.new(id, linkedin_url).google_sheet
  end
end
