class Application < ApplicationRecord
  before_action :authenticate_user!
  
  belongs_to :company
  belongs_to :candidate
end
