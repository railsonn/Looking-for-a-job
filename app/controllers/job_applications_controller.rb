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
    @job_application = @job.job_applications.build
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.build(job_application_params)

    set_associations

    if @job_application.save
      redirect_to @job, notice: "Candidatura enviada!"
    else
      render :new, status: :unprocessable_entity
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

  private

  def set_associations
    candidate = Candidate.first

    @job_application.candidate_id = candidate.id
    @job_application.resume.candidate_id = candidate.id 
    @job_application.company_id = @job.company.id
  end

  def job_application_params
    params.require(:job_application).permit(:job_id, :candidate_id, resume_attributes: [:file])
  end
end
