class ChangeNameModelAplicationToJobsAplication < ActiveRecord::Migration[8.0]
  def change
    rename_table :applications, :jobs_applications
  end
end
