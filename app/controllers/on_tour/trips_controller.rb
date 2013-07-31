class OnTour::TripsController < ApplicationController
  respond_to :json, :html

  before_filter :authenticate_user!, except: [:index]

  expose(:trips) { Trip.includes(match: :season).order('matches.date DESC') }
  expose(:trip)

  def index
    respond_with trips do |format|
      format.html
      format.json { render json: trips.extend(OnTour::TripsRepresenter).to_json(current_user_trips: current_user_trips) }
    end
  end

  def presence
    current_user.trips << trip

    respond_to do |format|
      format.json { head :ok }
    end
  end

  def absence
    current_user.trips.delete(trip)

    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def current_user_trips
    if user_signed_in?
      current_user.trips.pluck(:id)
    else
      []
    end
  end
end
