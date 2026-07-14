class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :resumes, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications
end
