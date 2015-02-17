module MCN::CandidateRepresenters
  class CandidateRepresenter < BaseDecorator
    property :voter_registration, as: :id
    property :name, as: :nomeCompleto
    property :gender, as: :sexo
    property :occupation, as: :nomeOcupacao
  end

  class CandidatesRepresenter < BaseDecorator
    collection :to_a, extend: MCN::CandidateRepresenters::CandidateRepresenter,
      class: Candidate, as: :candidates
  end
end
