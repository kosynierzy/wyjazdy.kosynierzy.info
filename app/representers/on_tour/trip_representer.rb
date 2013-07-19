require 'roar/representer/json'

module OnTour::TripRepresenter
  include Roar::Representer::JSON

  property :id
  property :official_number
end
