require 'spec_helper'

describe OnTour::TripsRepresenter do
  describe '#to_json' do
    before do
      trips = []

      5.times do |i|
        trips << double(:trip, id: i, official_number: 10)
      end

      json = trips.extend(described_class).to_json
      @parsed_body = JSON.parse(json)
    end

    it 'contains proper number of trips' do
      expect(@parsed_body.size).to eq(5)
    end
  end
end
