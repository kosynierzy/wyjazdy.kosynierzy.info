require 'representable/json/collection'

module TripsRepresenter
  include Representable::JSON::Collection

  items extend: TripRepresenter, class: Trip
end
