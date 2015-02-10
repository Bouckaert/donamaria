class RepresentativeDecorator < Draper::Decorator
  delegate_all

  def supporters_count
    if self.proposals.count != 0
      sum = 0
      self.proposals.each do |p|
        sum = sum + p.score
      end
      "Votos: #{sum}"
    else
      "No proposals yet!"
    end
  end

end
