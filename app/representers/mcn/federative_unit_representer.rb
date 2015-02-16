module MCN
  class FederativeUnitRepresenter < BaseDecorator
    property :id, as: :estadoId
    property :symbol, as: :sigla
    property :name, as: :nome
  end

  class FederativeUnitsRepresenter < BaseDecorator
    collection :to_a, extend: MCN::FederativeUnitRepresenter,
      class: Representable::FederativeUnit, as: :federative_units
  end
end
