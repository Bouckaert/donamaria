class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :description

      t.references :candidatura

      t.timestamps
    end
  end
end
