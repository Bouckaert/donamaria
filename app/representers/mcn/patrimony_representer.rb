module MCN
  class PatrimonyRepresenter < BaseDecorator
    property :description, as: :descricaoBem
    property :price, as: :valorBem
  end

  class PatrimoniesRepresenter < BaseDecorator
    collection :to_a, extend: MCN::PatrimonyRepresenter, class: Patrimony,
      as: :patrimonies
  end
end
