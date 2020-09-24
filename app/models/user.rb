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

      students = User.all

      if params[:look_for].present?
        students = User.where(company_hire: true) if params[:look_for] == '1'
        students = User.where(looking_for_internship: true) if params[:look_for] == '2'
        students = User.where(looking_for_job: true) if params[:look_for] == '3'
      end

      students = User.search_by_name(params[:name]) if params[:name].present?



      # diploma_id = params[:diploma].to_i
      # tags = Tag.where(diploma: diploma_id)

      # list_user = []


      # tags.each do |tag|
      #   list_user << tag.user
      # end



      # students = list_user




      return students

  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
