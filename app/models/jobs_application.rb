class JobApplication < ApplicationRecord  
  belongs_to :user
  belongs_to :job
  belongs_to :resume
end
