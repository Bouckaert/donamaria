class BaseDecorator < Roar::Decorator
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
end
