class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def edit
    @job_application = JobApplication.find(params[:id])
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end
  
  def new
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.new
  end

  def create 
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      redirect_to job_applications_path, notice: 'Job application was successfully created.'
    else
      render :new
    end
  end

  def update 
    @job_application = JobApplication.find(params[:id])

    if @job_application.update(job_application_params)
      redirect_to job_applications_path, notice: 'Job application was successfully updated.'
    else
      render :edit
    end
  end
end
