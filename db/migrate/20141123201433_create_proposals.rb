class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :description
      t.references :candidature

      t.timestamps
    end
  end
end
