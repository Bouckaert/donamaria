class CreatePatrimonies < ActiveRecord::Migration
  def change
    create_table :patrimonies do |t|
      t.string :sequencial_candidato
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.references :candidature, index: true

      t.timestamps
    end
  end
end
