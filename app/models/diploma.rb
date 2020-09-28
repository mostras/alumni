class Diploma < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :users, :through => :tags
end
