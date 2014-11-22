class CreateReceita < ActiveRecord::Migration
  def change
    create_table :receita do |t|
      t.string :sequencial_candidato
      t.string :numero_recibo_eleitoral
      t.string :nome_doador
      t.decimal :valor_receita, precision: 10, scale: 2
      t.string :descricao_da_receita
      t.references :candidatura

      t.timestamps
    end
  end
end
