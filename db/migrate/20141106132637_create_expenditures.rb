class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.string :sequencial_candidato
      t.string :seller
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.references :candidature

      t.timestamps
    end
  end
end
