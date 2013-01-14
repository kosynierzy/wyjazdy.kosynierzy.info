class OnTour::SeasonsController < ApplicationController
  expose(:season, finder: :find_by_name)
  expose(:trips) { Trip.joins(:match).order('matches.date DESC').where('season_id = ?', season.id) }
end
