class CandidateRepresenter < BaseDecorator
  property :id
  property :name, as: :nomeCompleto
  property :gender, as: :sexo
  property :occupation, as: :nomeOcupacao
end
