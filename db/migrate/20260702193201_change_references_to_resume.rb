class ChangeReferencesToResume < ActiveRecord::Migration[8.0]
  def change
    remove_reference :resumes, :users
    add_reference :resumes, :candidate, foreign_key: true
  end
end
