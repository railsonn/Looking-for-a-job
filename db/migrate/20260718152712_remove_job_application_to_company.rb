class RemoveJobApplicationToCompany < ActiveRecord::Migration[8.0]
  def change
    remove_column :companies, :jobs_application_id, :integer
  end
end
