class ResumesController < ApplicationController
  require "pdf/reader"

  def index
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    
    if @resume.save
      ResumeImportJob.perform_later(@resume.id)
      redirect_to resumes_path, notice: 'Resume was successfully uploaded and is being processed.'
    else
      render :new
    end

    # Extrair texto do PDF
    pdf = PDF::Reader.new(
      StringIO.new(resume.file.download)
    )

    text = pdf.pages.map(&:text).join("\n")

    puts "Texto extraído do PDF: #{text} ----------------------------------------"

    @resumes = Resume.all
  end

  def edit
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def resume_params
    params.require(:resume).permit(:file)
  end
end
