class ChangeNameJobsApplicationToJobApplication < ActiveRecord::Migration[8.0]
  def change
    rename_table :jobs_applications, :job_applications
  end
end
