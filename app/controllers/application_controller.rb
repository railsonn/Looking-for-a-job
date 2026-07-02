class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :current_user

  def current_user
    @current_user ||= Candidate.find_by(id: session[:user_id])
  end

  allow_browser versions: :modern
end
