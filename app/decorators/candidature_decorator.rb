class CandidatureDecorator < Draper::Decorator
  delegate_all

  def revenue
    link_to_financial_activity 'revenue'
  end

  def expenditure
    link_to_financial_activity 'expenditure'
  end

  def patrimony
    link_to_financial_activity 'patrimony'
  end

  private

  def link_to_financial_activity(type)
    h.link_to number_to_currency(object.public_send("total_#{type}")),
      "##{type}-#{object.id}", class: 'btn btn-danger', data: { toggle: :modal }
  end
end
