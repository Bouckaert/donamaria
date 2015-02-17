module MCN::PatrimonyRepresenters
  class PatrimonyRepresenter < BaseDecorator
    property :description, as: :descricaoBem
    property :price, as: :valorBem
  end

  class PatrimoniesRepresenter < BaseDecorator
    collection :to_a, extend: MCN::PatrimonyRepresenters::PatrimonyRepresenter,
      class: Patrimony, as: :patrimonies
  end
end
