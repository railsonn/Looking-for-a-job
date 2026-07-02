class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def delete
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to companies_path, notice: 'Company was successfully deleted.'
    else
      redirect_to companies_path, alert: 'Failed to delete company.'
    end
  end
end
