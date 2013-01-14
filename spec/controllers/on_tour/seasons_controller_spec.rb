require 'spec_helper'

describe OnTour::SeasonsController do

  describe "GET 'show'" do
    before(:each) do
      @season = create(:season, name: '2000/01')
    end

    it "returns http success" do
      get 'show', :id => '2000/01'
      response.should be_success
    end

    it "exposes season" do
      get 'show', :id => '2000/01'
      controller.season.should eq(@season)
    end
  end

end
