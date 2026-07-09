class ResumeImportJob < ApplicationJob
  queue_as :default

  require "pdf-reader"
  require "stringio"

  def perform(resume_id)
    resume = Resume.find(resume_id)

    # Extrair texto do PDF
    text = PDF::Reader.new(resume.file.download).pages.map(&:text).join("\n")

    # Chamar IA
    data = ResumeParser.call(text)
    
    user = Candidate.first 

    resume = user.resumes.create!(status: "pending")

    resume.file.attach(
      io: File.open("/home/seu_usuario/Downloads/clientes_teste"),
      filename: "teste.pdf",
      content_type: "application/pdf"
    )

    print("#{resume} ---------------------------------------------------------------------------------")
  end
end
