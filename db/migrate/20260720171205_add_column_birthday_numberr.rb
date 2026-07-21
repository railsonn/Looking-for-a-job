class AddColumnBirthdayNumberr < ActiveRecord::Migration[8.0]
  def change
    add_column :candidates, :number, :integer
    add_column :candidates, :birthday, :datetime
  end
end
