class OnTour::TripsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  expose(:trips) { Trip.joins(:match).order('matches.date DESC') }
  expose(:trip)

  def presence
    current_user.trips << trip

    redirect_to root_path, notice: t('update.success')
  end

  def absence
    current_user.trips.delete(trip)

    redirect_to root_path, notice: t('update.success')
  end
end
