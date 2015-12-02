describe OnTour::SeasonRepresenter do
  let(:season) { create(:season) }

  describe '#to_json' do
    before do
      json = season.extend(described_class).to_json
      @parsed_body = JSON.parse(json)
    end

    it 'contains season id' do
      expect(@parsed_body['id']).to eq(season.id)
    end

    it 'contains season name' do
      expect(@parsed_body['name']).to eq(season.name)
    end
  end
end
