class ProfilesController < ApplicationController

  def index 

  end

  def new

  end

  def create 
    case params[:profile_type]
    when "company"
      current_user.create_company!
      redirect_to edit_company_path(current_user.company)
    when "candidate"
      current_user.create_candidate!
      redirect_to edit_candidate_path(current_user.candidate)
    else
      flash.now[:alert] = "Escolha um tipo de perfil."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
  end
end
