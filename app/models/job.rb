class Job < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :salary, presence: true
  validates :location, presence: true
  validates :employment_type, presence: true
  validates :status, presence: true
end
