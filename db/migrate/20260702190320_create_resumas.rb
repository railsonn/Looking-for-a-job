class CreateResumas < ActiveRecord::Migration[8.0]
  def change
    create_table :resumas do |t|
      t.string :file
      t.string :status
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
