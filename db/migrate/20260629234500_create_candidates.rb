class CreateCandidates < ActiveRecord::Migration[8.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :lastName
      t.integer :cpf

      t.timestamps
    end
  end
end
