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

  include PgSearch
  pg_search_scope :search_by_name, against: [:first_name, :last_name],
  using: {
    tsearch: { prefix: true }
  }

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.search(params)
    if params
      students = User.search_by_name(params[:name])

      # if params[:look_for] === 1
      #   students = User.where(company_hire: true)
      # end

    else
      students = User.all
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
