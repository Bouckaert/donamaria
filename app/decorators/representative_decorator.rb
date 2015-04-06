class RepresentativeDecorator < Draper::Decorator
  delegate_all

  def supporters_count
    if self.proposals.count != 0
          supporters = []
      self.proposals.each do |proposal|
        proposal.get_upvotes.each do |vote|
          supporters << vote.voter_id unless supporters.include?(vote.voter_id)
        end
      end
      supporters.count
    else
      "Nenhum apoiador ainda!"
    end
  end

  def proposals_titles
    if self.proposals.count != 0
      links = []
      self.proposals.each do |proposal|
        links << h.link_to(proposal.title, h.proposal_path(proposal), class: 'btn btn-default')
      end
      links.join(' ').html_safe
    else
      "Nenhuma proposta ainda!"
    end
  end

  def supporters_id
    if self.proposals.count != 0
      sid = []
      supporters = []
      self.proposals.each do |proposal|
        proposal.get_upvotes.each do |vote|
          supporters << vote.voter_id unless supporters.include?(vote.voter_id)
        end
      end
      supporters.each do |supporter|
        sid << h.link_to(supporter, 'h.user_path(user)', class: 'btn btn-default')
      end
      sid.join(' ').html_safe
    else
      "Nenhum apoiador ainda!"
    end
  end

end
