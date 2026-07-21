class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show 
    @candidate = Candidate.find(params[:id])
  end

  def new
    
  end

  def edit
    @candidate = Candidate.find(params[:id])
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
    @candidate = Candidate.find(params[:id])

    if @candidate.destroy
      redirect_to candidates_path, notice: 'Candidate was successfully deleted.'
    else
      redirect_to candidates_path, alert: 'Failed to delete candidate.'
    end
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, notice: 'Candidate was successfully created.'
    else
      render :new
    end
  end

  private 

  def candidate_params
    params.require(:candidate).permit(:name, :lastName, :cpf, :email, :birthday, :number, :website)
  end
end
