class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.string :sequencial_candidato
      t.string :receipt_title
      t.string :donator
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.references :candidature

      t.timestamps
    end
  end
end
