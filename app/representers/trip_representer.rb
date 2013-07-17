require 'roar/representer/json'

module TripRepresenter
  include Roar::Representer::JSON

  property :id
  property :official_number
end
