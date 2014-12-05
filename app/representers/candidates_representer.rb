class CandidatesRepresenter < BaseDecorator
  collection :to_a, extend: CandidateRepresenter, class: Candidate, as: :candidates
end
