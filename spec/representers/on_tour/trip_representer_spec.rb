require 'spec_helper'

describe OnTour::TripRepresenter do
  let(:trip) { create(:trip) }

  describe '#to_json' do
    before do
      json = trip.extend(described_class).to_json
      @parsed_body = JSON.parse(json)
    end

    it 'contains trip id' do
      expect(@parsed_body['id']).to eq(trip.id)
    end

    it 'contains trip official number' do
      expect(@parsed_body['official_number']).to eq(trip.official_number)
    end

    it 'contains match' do
      expect(@parsed_body['match']['id']).to eq(trip.match_id)
    end

    it 'contains comment' do
      expect(@parsed_body['comment']).to eq(trip.comment)
    end

    it 'contains article url' do
      expect(@parsed_body['article_url']).to eq(trip.article_url)
    end
  end
end
