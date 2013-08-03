module OnTour
  class TripsHeaderSection < SitePrism::Section
    element :presence_cell, :xpath, 'th[8]'
  end
end
