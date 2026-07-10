class AddFieldsToCompany < ActiveRecord::Migration[8.0]
  def change
    add_column :companies, :email, :string
    add_column :companies, :description, :text
    add_column :companies, :location, :string
    add_column :companies, :website, :string
    add_column :companies, :active, :boolean, default: true
  end
end
