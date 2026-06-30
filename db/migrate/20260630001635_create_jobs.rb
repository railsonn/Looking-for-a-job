class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.float :salary
      t.string :location
      t.string :contract_type

      t.timestamps
    end
  end
end
