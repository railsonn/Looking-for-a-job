class RemoveReferenceToJob < ActiveRecord::Migration[8.0]
  def change
    remove_column :jobs, :jobs_applications_id, :integer
  end
end
