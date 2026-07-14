class Job < ApplicationRecord
  belongs_to :company
  

  validates :title, presence: true
  validates :description, presence: true
  validates :salary, presence: true
  validates :location, presence: true
  validates :contract_type, presence: true
end