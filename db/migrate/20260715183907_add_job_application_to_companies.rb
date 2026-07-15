class AddJobApplicationToCompanies < ActiveRecord::Migration[8.0]
  def change
    add_reference :companies, :jobs_application, foreign_key: true
  end
end