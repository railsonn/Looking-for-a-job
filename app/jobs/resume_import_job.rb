class ResumeImportJob < ApplicationJob
  queue_as :default

  def perform(resume_id)
    resume = Resume.find(resume_id)
    resume.import!
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error("Resume with ID #{resume_id} not found: #{e.message}")
  end
end
