class JobApplication < ApplicationRecord  
  belongs_to :candidate
  belongs_to :job
  belongs_to :resume
  belongs_to :company

  validates :cover_letter, presence: true
end
