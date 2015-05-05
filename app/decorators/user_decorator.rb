class UserDecorator < Draper::Decorator
  delegate_all

  def supporting_count(support)
    if support.count != 0
          supporters = []
      support.each do |proposal|
          supporters << proposal unless supporters.include?(proposal)
      end
      supporters.count
    else
      "Nenhum apoiador ainda!"
    end
  end

  def supporting_proposals(support)
    if support.count != 0
      links = []
      support.each do |proposal|
        links << h.link_to(proposal, h.proposal_path(proposal), class: 'btn btn-default')
      end
      links.join(' ').html_safe
    else
      "Nenhuma proposta ainda!"
    end
  end

    def against_count(against)
    if against.count != 0
          supporters = []
      against.each do |proposal|
          supporters << proposal unless supporters.include?(proposal)
      end
      supporters.count
    else
      "Nenhum apoiador ainda!"
    end
  end

  def against_proposals(against)
    if against.count != 0
      links = []
      against.each do |proposal|
        links << h.link_to(proposal, h.proposal_path(proposal), class: 'btn btn-default')
      end
      links.join(' ').html_safe
    else
      "Nenhuma proposta ainda!"
    end
  end

  def representatives_id(representatives)
    if representatives.count != 0
      sid = []
      supporters = []
      representatives.each do |proposal|
        supporters << proposal unless supporters.include?(proposal)
      end
      supporters.each do |supporter|
        sid << h.link_to(supporter, 'h.user_path(user)', class: 'btn btn-default')
      end
      sid.join(' ').html_safe
    else
      "Nenhum apoiador ainda!"
    end
  end

  def unrepresentatives_id(unrepresentatives)
    if unrepresentatives.count != 0
      sid = []
      supporters = []
      unrepresentatives.each do |proposal|
          supporters << proposal unless supporters.include?(proposal)
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
