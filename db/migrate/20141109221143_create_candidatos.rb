class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :nome_candidato
      t.string :descricao_ocupacao
      t.string :descricao_sexo
      t.string :numero_titulo_eleitor

       t.references :user

      t.timestamps
    end
  end
end
