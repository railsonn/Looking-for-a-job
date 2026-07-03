class ResumeImportJob < ApplicationJob
  queue_as :default

  def perform(resume_id)
    resume = Resume.find(resume_id)

    resume.processing!

    # Extrair texto do PDF
    text = PdfExtractor.call(resume.file)

    # Chamar IA
    data = ResumeParser.call(text)

    resume.update!(
      raw_text: text,
      parsed_data: data,
      status: :processed
    )
  rescue
    resume.failed!
  end
end
