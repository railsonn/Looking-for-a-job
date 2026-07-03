class Resume < ApplicationRecord
  belongs_to :candidates
  
  has_one_attached :file
end
