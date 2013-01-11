class OnTour::TripsController < ApplicationController
  expose(:trips) { Trip.joins(:match).order('matches.date DESC') }
end
