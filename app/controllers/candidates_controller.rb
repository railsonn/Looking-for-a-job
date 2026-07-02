class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    
  end

  def edit

  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: 'Candidate was successfully updated.'
    else
      render :edit
    end
  end

  def delete
  end

  def create
  end
end
