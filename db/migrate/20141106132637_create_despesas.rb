class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.string :sequencial_candidato
      t.string :nome_fornecedor
      t.decimal :valor_despesa, precision: 10, scale: 2
      t.string :descricao_despesa
      t.references :candidatura

      t.timestamps
    end
  end
end
