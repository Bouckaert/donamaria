class RevenuesRepresenter < BaseDecorator
  collection :to_a, extend: RevenueRepresenter, class: Revenue, as: :revenues
end
