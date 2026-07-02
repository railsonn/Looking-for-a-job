class ChangeNameToModelResuma < ActiveRecord::Migration[8.0]
  def change
     rename_table :resumas, :resumes
  end
end
