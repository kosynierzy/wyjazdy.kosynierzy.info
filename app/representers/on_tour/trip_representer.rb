require 'roar/representer/json'

module OnTour::TripRepresenter
  include Roar::Representer::JSON

  property :id
  property :official_number
  property :match, extend: OnTour::MatchRepresenter
end
