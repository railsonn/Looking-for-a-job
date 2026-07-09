class ResumeImportJob < ApplicationJob
  queue_as :default
  require "pdf-reader"
  require "stringio"

  def perform(resume_id)
    resume = Resume.find(resume_id)

    # Extrair texto do PDF
    pdf = PDF::Reader.new(
      StringIO.new(resume.file.download)
    )

    text = pdf.pages.map(&:text).join("\n")

    # Chamar IA
    data = ResumeParser.call(text)
    
    user = Candidate.first 

    resume.update!(
      raw_text: text,
      parsed_data: data,
      status: "completed"
    )

    rescue => e
      resume.update(status: "failed") if resume.present?

      Rails.logger.error e.full_message
    end
  end
end
