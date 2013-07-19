require 'roar/representer/json'

module OnTour::SeasonRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
end
