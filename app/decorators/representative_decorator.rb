class RepresentativeDecorator < Draper::Decorator
  delegate_all

  def supporters_count
    if self.proposals.count != 0
      score = proposals.map(&:score).inject(:+)
      "#{score}"
    else
      "Nenhuma proposta ainda!"
    end
  end

  def proposals_titles
    if self.proposals.count != 0
      hashtags = proposals.map { |p| p.title  }
    else
      "Nenhuma proposta ainda!"
    end
  end
end
