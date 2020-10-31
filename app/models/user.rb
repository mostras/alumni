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
  has_many :companies, through: :work_experiences
  has_many :school_experiences, dependent: :destroy
  has_many :schools, through: :school_experiences
  has_many :visit, dependent: :destroy
  has_many :assignements, dependent: :destroy
  has_many :parsings, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :popup_messages

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_create :capitalize_names
  before_create :delete_ghost

  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:first_name, :last_name],
  using: {
    tsearch: { prefix: true }
  }

  def self.search(params)
      students = User.all

      if params[:look_for].present?
        students = students.where(looking_for_internship: true) if params[:look_for] == '1'
        students = students.where(looking_for_job: true) if params[:look_for] == '2'
      end

      if params[:diploma].present?
        diploma_id = params[:diploma].to_i
        students = students.includes(:tags).where(tags: { diploma_id: diploma_id })
      end

      if params[:year].present?
        diploma_year = params[:year].to_i
        students = students.includes(:tags).where(tags: { year: diploma_year })
      end

      if params[:sector].present?
        sector_id = params[:sector].to_i
        students = students.includes(:user_sectors).where(user_sectors: { sector_id: sector_id })
      end

      students = students.search_by_name(params[:name]) if params[:name].present?

      return students
  end

  def capitalize_names
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize

  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def delete_ghost
    user = Ghost.find_by(email: email)
    unless user.nil?
      user.destroy
    end
  end
end











