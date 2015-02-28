module MCN::RevenueRepresenters
  class RevenueRepresenter < BaseDecorator
    property :donator, as: :nomeDoador
    property :price, as: :valor
    property :description, as: :tipoReceita
  end

  class RevenuesRepresenter < BaseDecorator
    collection :to_a, extend: MCN::RevenueRepresenters::RevenueRepresenter,
      class: Revenue, as: :revenues
  end
end
