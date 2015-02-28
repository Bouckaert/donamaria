class RepresentativeDecorator < Draper::Decorator
  delegate_all

  def supporters_count
    if self.proposals.count != 0
      score = proposals.map(&:score).inject(:+)
      "Votos: #{score}"
    else
      "Nenhuma proposta ainda!"
    end
  end
end
