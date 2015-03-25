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
      hashtags = proposals.map(&:title)
      links = []
      self.proposals.each do |proposal|
        links << h.link_to(proposal.title, h.proposal_path(proposal), class: 'btn btn-default')
      end
      links.join(' ').html_safe
    else
      "Nenhuma proposta ainda!"
    end
  end
end
