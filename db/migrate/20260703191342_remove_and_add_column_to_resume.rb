class RemoveAndAddColumnToResume < ActiveRecord::Migration[8.0]
  def change
    remove_column :resumes, :file, :string
    add_column :resumes, :raw_text, :text
    add_column :resumes, :parsed_data, :json
  end
end
