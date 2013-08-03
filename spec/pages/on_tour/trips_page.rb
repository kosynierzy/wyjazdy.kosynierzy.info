class OnTour::TripsPage < SitePrism::Page
  set_url 'http://wyjazdy.lvh.me/'

  section :trips, OnTour::TripsTableSection, "#trips"
end
