class Resume < ApplicationRecord
  belongs_to :candidate
  
  has_many :job_applications, dependent: :destroy
  has_one_attached :file
end
