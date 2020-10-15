class Ghost < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:first_name, :last_name],
  using: {
    tsearch: { prefix: true }
  }

  def self.search(params)
    ghosts = Ghost.all

    ghosts = Ghost.search_by_name(params[:name]) if params[:name].present?

    return ghosts
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
