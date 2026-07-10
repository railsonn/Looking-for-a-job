class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  has_one_attached :logo
end
