class RemoveJobApplicationToCompany < ActiveRecord::Migration[8.0]
  def change
    remove_column :companies, :job_application_id, :integer
  end
end
