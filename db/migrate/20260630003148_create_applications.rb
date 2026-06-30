class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.references :company, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
