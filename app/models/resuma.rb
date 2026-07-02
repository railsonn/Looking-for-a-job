class Resuma < ApplicationRecord
  belongs_to :users
  
  has_one_attached :file
end
