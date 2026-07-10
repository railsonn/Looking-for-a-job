class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    
    if @job.save
      redirect_to jobs_path, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, notice: 'Job was successfully deleted.'
  end

  def edit

  end

  def update
    @job = Job.find(params[:id])
    
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :requirements,
      :salary,
      :location,
      :employment_type,
      :status,
      :company_id
    )
  end
end
