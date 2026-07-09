class ResumesController < ApplicationController
  require "pdf/reader"

  def index
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.candidate = Candidate.first

    unless @resume.save
      puts @resume.errors.full_messages
      render :new, status: :unprocessable_entity
      return
    end

    pdf = PDF::Reader.new(
      StringIO.new(@resume.file.download)
    )

    puts @resume.file.attached?
    # Extrair texto do PDF

    text = pdf.pages.map(&:text).join("\n")

    @resume.update(status: "completed", raw_text: text, parsed_data: ResumeParser.call(text))

    redirect_to preview_resume_path(@resume)
  end

  def edit
  end

  def preview
    @resume = Resume.find(params[:id])
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
