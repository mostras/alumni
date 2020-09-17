class Diploma < ApplicationRecord
  has_many :tags, dependent: :destroy
end
