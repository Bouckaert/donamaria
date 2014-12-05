class CandidateRepresenter < BaseDecorator
  property :voter_registration, as: :id
  property :name, as: :nomeCompleto
  property :gender, as: :sexo
  property :occupation, as: :nomeOcupacao
end
