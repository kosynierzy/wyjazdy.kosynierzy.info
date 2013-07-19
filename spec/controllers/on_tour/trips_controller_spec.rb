require 'spec_helper'

describe OnTour::TripsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it "exposes trips" do
      trip = create(:trip)
      get 'index'
      expect(controller.trips).to eq([trip])
    end

    context "json format" do
      before do
        create(:trip)
      end

      it "puts trips into json" do
        get 'index', format: 'json'
        body = JSON.parse(response.body)
        expect(body.size).to eq(1)
      end
    end
  end

end
