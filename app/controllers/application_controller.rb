class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!

  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.company.nil? && resource.candidate.nil?
      choose_profile_path
    else
      super
    end
  end

end
