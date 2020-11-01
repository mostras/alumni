class PopupMessage < ApplicationRecord
  belongs_to :user

  validates :message, length: { maximum: 400 }
end
