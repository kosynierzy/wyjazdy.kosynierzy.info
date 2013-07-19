require 'spec_helper'

describe OnTour::MatchRepresenter do
  let(:match) { create(:match) }

  describe '#to_json' do
    before do
      json = match.extend(described_class).to_json
      @parsed_body = JSON.parse(json)
    end

    it 'contains match id' do
      expect(@parsed_body['id']).to eq(match.id)
    end

    it 'contains away score' do
      expect(@parsed_body['away_score']).to eq(match.away_score)
    end

    it 'contains home score' do
      expect(@parsed_body['home_score']).to eq(match.home_score)
    end

    it 'contains away team' do
      expect(@parsed_body['away_team']).to eq(match.away_team)
    end

    it 'contains home team' do
      expect(@parsed_body['home_team']).to eq(match.home_team)
    end

    it 'contains date' do
      expect(@parsed_body['date']).to eq(match.date.to_s)
    end

    it 'contains game type' do
      expect(@parsed_body['game_type']).to eq(match.game_type)
    end

    it 'contains stats url' do
      expect(@parsed_body['stats_url']).to eq(match.stats_url)
    end
  end
end
