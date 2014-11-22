class CreatePatrimonios < ActiveRecord::Migration
  def change
    create_table :patrimonios do |t|
      t.string :sequencial_candidato
      t.string :detalhe_bem
      t.decimal :valor_bem, precision: 10, scale: 2
      t.references :candidatura, index: true

      t.timestamps
    end
  end
end
