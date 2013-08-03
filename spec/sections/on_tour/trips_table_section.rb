require_relative './trips_header_section'
require_relative './trips_row_section'

module OnTour
  class TripsTableSection < SitePrism::Section
    section :header, OnTour::TripsHeaderSection, "thead tr"
    sections :rows, OnTour::TripsRowSection, "tbody tr"
  end
end
