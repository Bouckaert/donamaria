class PatrimoniesRepresenter < BaseDecorator
  collection :to_a, extend: PatrimonyRepresenter, class: Patrimony, as: :patrimonies
end
