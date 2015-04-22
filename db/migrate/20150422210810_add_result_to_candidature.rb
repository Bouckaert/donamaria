class AddResultToCandidature < ActiveRecord::Migration
  def change
    add_column :candidatures, :result, :string
  end
end
