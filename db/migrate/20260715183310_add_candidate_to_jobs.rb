class AddCandidateToJobs < ActiveRecord::Migration[8.0]
  def change
    add_reference :jobs, :jobs_applications, null: true, foreign_key: true
  end
end
