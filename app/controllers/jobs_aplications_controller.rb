class JobsAplicationsController < ApplicationController
  def index
    @jobs_apllications = JobsAplication.all
  end

  def edit
    @job_application = JobsAplication.find(params[:id])
  end

  def show
    @job_application = JobsAplication.find(params[:id])
  end

  def new
    @job_application = JobsAplication.new
  end

  def create 
    @job_application = JobsAplication.new(job_application_params)

    if @job_application.save
      redirect_to jobs_aplications_path, notice: 'Job application was successfully created.'
    else
      render :new
    end
  end

  def update 
    @job_application = JobsAplication.find(params[:id])
    
    if @job_application.update(job_application_params)
      redirect_to jobs_aplications_path, notice: 'Job application was successfully updated.'
    else
      render :edit
    end
  end
end
