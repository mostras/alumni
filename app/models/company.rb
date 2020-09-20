class Company < ApplicationRecord
  has_many :work_experiences, dependent: :destroy
end
