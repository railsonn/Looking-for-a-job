class ResumesController < ApplicationController
  require "pdf/reader"

  def index
    @resumes = Resume.all
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
  end

  def edit
  end

  def preview
    @resume = Resume.find(params[:id])
  end

  def show
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    if @resume.destroy
      redirect_to resumes_path, notice: 'Resume was successfully deleted.'
    else
      redirect_to resumes_path, alert: 'Failed to delete resume.'
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:file)
  end
end
