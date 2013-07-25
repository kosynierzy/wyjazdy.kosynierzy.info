require 'spec_helper'

describe OnTour::TripRepresenter do
  let(:trip) { create(:trip) }
  let(:user) { double(:user, trips: []) }

  describe '#to_json' do
    before do
      json = trip.extend(described_class).to_json(current_user: user)
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

    context 'guest user' do
      let(:user) { nil }

      it 'contains false presence' do
        expect(@parsed_body['presence']).to eq(false)
      end
    end

    context 'user have not been on trip' do
      let(:user) { double(:user, trips: []) }

      it 'contains false presence' do
        expect(@parsed_body['presence']).to eq(false)
      end
    end

    context 'user have been on trip' do
      let(:user) { double(:user, trips: [trip]) }

      it 'contains true presence' do
        expect(@parsed_body['presence']).to eq(true)
      end
    end
  end
end
