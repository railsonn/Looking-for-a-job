class JobApplication < ApplicationRecord  
  belongs_to :candidate
  belongs_to :job
  belongs_to :resume

  accepts_nested_attributes_for :resume
end
