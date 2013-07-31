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

  describe "POST 'presence'" do
    let(:current_user) { create(:user) }
    let(:trip) { create(:trip) }

    before do
      sign_in current_user
    end

    it "returns http success" do
      post 'presence', trip_id: trip.id, format: 'json'
      expect(response).to be_success
    end

    it "exposes trip" do
      post 'presence', trip_id: trip.id, format: 'json'
      expect(controller.trip).to eq(trip)
    end

    it "returns nothing" do
      post 'presence', trip_id: trip.id, format: 'json'
      expect(body).to be_blank
    end

    it "adds trip to current user trips" do
      expect do
        post 'presence', trip_id: trip.id, format: 'json'
        current_user.reload
      end.to change{ current_user.trips.size }.by(1)
    end
  end

  describe "DELETE 'absence'" do
    let(:current_user) { create(:user) }
    let(:trip) { create(:trip) }

    before do
      current_user.trips << trip
      sign_in current_user
    end

    it "returns http success" do
      delete 'absence', trip_id: trip.id, format: 'json'
      expect(response).to be_success
    end

    it "exposes trip" do
      delete 'absence', trip_id: trip.id, format: 'json'
      expect(controller.trip).to eq(trip)
    end

    it "returns nothing" do
      delete 'absence', trip_id: trip.id, format: 'json'
      expect(body).to be_blank
    end

    it "removes trip from current user trips" do
      expect do
        delete 'absence', trip_id: trip.id, format: 'json'
        current_user.reload
      end.to change{ current_user.trips.size }.by(-1)
    end
  end
end
