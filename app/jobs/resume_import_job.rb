class ResumeImportJob < ApplicationJob
  queue_as :default

  def perform(resume_id)
    resume = Resume.find(resume_id)

    ResumeImporter.new(resume).call

    candidate = Candidate.first
    resume = candidate.resumes.create!(status: :pending)

    resume.file.attach(
      io: File.open("/caminho/curriculo.pdf"),
      filename: "curriculo.pdf",
      content_type: "application/pdf"
    )
  end
end
