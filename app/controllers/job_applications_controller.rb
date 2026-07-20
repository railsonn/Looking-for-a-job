class JobApplicationsController < ApplicationController
  def index
    if current_user.candidate.job_applications.
    @job_applications = current_user.candidate
                                    .job_applications
                                    .includes(:job, :company, :resume)
                                    .order(created_at: :desc)
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
    @resume = Resume.find(params[:job_application][:resume_id]) 

    set_associations

    if @job_application.save
      redirect_to @job, notice: "Candidatura enviada!"
    else
      @resume = Resume.new
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
    candidate = current_user.candidate || Candidate.create(user: current_user)

    @job_application.candidate = candidate
    @job_application.company = @job.company
  end

  def job_application_params
    params.require(:job_application).permit(:job_id, :candidate_id, :company_id, :resume_id, :cover_letter)
  end
end
