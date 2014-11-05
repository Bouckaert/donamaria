class CreateCandidaturas < ActiveRecord::Migration
  def change
    create_table :candidaturas do |t|
      t.string :sequencial_candidato
      t.integer :ano_eleicao
      t.string :descricao_eleicao
      t.string :sigla_UF
      t.string :descricao_UE
      t.string :descricao_cargo
      t.string :numero_candidato
      t.string :sigla_partido
      t.string :composicao_legenda
      t.string :desc_sit_tot_turno

      t.timestamps
    end
  end
end
