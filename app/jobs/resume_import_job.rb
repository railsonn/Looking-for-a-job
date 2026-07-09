class ResumeImportJob < ApplicationJob
  queue_as :default

  def perform(resume_id)
    resume = Resume.find(resume_id)

    resume.processing!

    # Extrair texto do PDF
    text = PdfExtractor.call(resume.file)

    # Chamar IA
    data = ResumeParser.call(text)
    
    user = Candidate.first 

    resume = user.resumes.create!(status: "pending")

    resume.file.attach(
      io: File.open("/home/seu_usuario/Downloads/clientes_teste"),
      filename: "teste.pdf",
      content_type: "application/pdf"
    )

    print(resume)
  rescue
    resume.failed!
  end
end
