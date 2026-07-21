class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  
  has_many :resumes, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  has_many :jobs, through: :job_applications

  validates :name, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :cpf, presence: true
  validates :birthday, presence: true
  validates :number, presence: true
  validates :website, presence: true
end
