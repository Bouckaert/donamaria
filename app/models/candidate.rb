class Candidate < Representative
  has_many :candidatures, foreign_key: :representative_id
end
