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
        links << h.link_to(proposal.title, h.proposal_path(proposal.id), class: 'btn btn-default')
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
        links << h.link_to(proposal.title, h.proposal_path(proposal.id), class: 'btn btn-default')
      end
      links.join(' ').html_safe
    else
      "Nenhuma proposta ainda!"
    end
  end

  def representatives(representatives)
    if representatives.count != 0
      sid = []
      representatives.each do |representative|
        sid << h.link_to(h.image_tag(representative.user.image, size: '34x34'), h.representative_path(representative.id))
      end
      sid.join(' ').html_safe
    else
      "Ainda não apoiou nenhum representante!"
    end
  end

  def unrepresentatives(unrepresentatives)
    if unrepresentatives.count != 0
      sid = []
      unrepresentatives.each do |unrepresentative|
        sid << h.link_to(h.image_tag(unrepresentative.user.image, size: '34x34'), h.representative_path(unrepresentative.id))
      end
      sid.join(' ').html_safe
    else
      "Ainda não discordou de nenhum representante!"
    end
  end
end
