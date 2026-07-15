class Job < ApplicationRecord
  belongs_to :company
  belongs_to :candidate, optional: true
  

  validates :title, presence: true
  validates :description, presence: true
  validates :salary, presence: true
  validates :location, presence: true
  validates :contract_type, presence: true
end