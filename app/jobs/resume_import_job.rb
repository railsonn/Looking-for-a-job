class ResumeImportJob < ApplicationJob
  queue_as :default

  def perform(resume_id)
    resume = Resume.find(resume_id)

    ResumeImporter.new(resume).call
  end
end
