class FederativeUnitsRepresenter < BaseDecorator
  collection :to_a, extend: FederativeUnitRepresenter, class: Representable::FederativeUnit, as: :federative_units
end
