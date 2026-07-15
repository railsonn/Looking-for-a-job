class AddResumeToJobApplications < ActiveRecord::Migration[8.0]
  def change
    add_reference :jobs_applications, :resume, null: false, foreign_key: true
  end
end
