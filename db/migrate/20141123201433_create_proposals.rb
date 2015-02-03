class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :description
      t.references :representative

      t.timestamps
    end
  end
end
