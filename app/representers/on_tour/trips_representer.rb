require 'representable/json/collection'

module OnTour::TripsRepresenter
  include Representable::JSON::Collection

  items extend: OnTour::TripRepresenter, class: Trip
end
