class AddColumnWebsiteToCandidate < ActiveRecord::Migration[8.0]
  def change
    add_column :candidates, :website, :string
  end
end
