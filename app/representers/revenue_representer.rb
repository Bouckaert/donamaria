class RevenueRepresenter < BaseDecorator
  property :donator, as: :nomeDoador
  property :price, as: :valor
  property :description, as: :tipoReceita
end
