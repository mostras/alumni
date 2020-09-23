class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :tags
  has_many :user_sectors
  validates_length_of :user_sectors, maximum: 5
  has_many :work_experiences, dependent: :destroy
  has_many :school_experiences, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
