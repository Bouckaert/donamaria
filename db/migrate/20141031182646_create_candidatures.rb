class CreateCandidatures < ActiveRecord::Migration
  def change
    create_table :candidatures do |t|
      t.string :sequencial_candidato
      t.integer :election_year
      t.string :election_description
      t.string :federative_unit_symbol
      t.string :federative_unit_description
      t.string :job_title
      t.string :candidate_number
      t.string :political_party_symbol
      t.string :political_caption
      t.string :desc_sit_tot_turno

      t.references :representative

      t.timestamps
    end
  end
end
