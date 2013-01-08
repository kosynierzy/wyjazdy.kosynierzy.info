require 'spec_helper'

describe OnTour::TripsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "exposes trips" do
      trip = create(:trip)
      get 'index'
      controller.trips.should eq([trip])
    end
  end

end
