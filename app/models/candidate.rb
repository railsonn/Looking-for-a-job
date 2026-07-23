class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  
  has_many :resumes, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  has_many :jobs, through: :job_applications
end
