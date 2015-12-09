class OnTour::TripsController < ApplicationController
  respond_to :json, :html

  before_action :authenticate_user!, except: [:index]

  expose(:trips) { Trip.includes(match: :season).order('matches.date DESC') }
  expose(:trip)

  def index
    respond_with trips do |format|
      format.html
      format.json { render json: trips.extend(OnTour::TripsRepresenter).to_json(user_id: current_user_data.try(:[], "id")) }
    end
  end

  def presence
    trip.participants.push(current_user_data["id"])
    trip.save!

    respond_to do |format|
      format.json { head :ok }
    end
  end

  def absence
    trip.participants.delete(current_user_data["id"])
    trip.save!

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
