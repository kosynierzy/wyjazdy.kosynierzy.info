require 'spec_helper'

describe OnTour::SeasonsController do

  describe "GET 'show'" do
    before(:each) do
      @season = create(:season, name: '2000/01')
    end

    it "returns http success" do
      get 'show', :id => '2000/01'
      expect(response).to be_success
    end

    it "exposes season" do
      get 'show', :id => '2000/01'
      expect(controller.season).to eq(@season)
    end
  end

end
