require 'spec_helper'

describe Match do
  it { should validate_presence_of(:home_team) }
  it { should validate_presence_of(:away_team) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:game_type) }
  it { should validate_presence_of(:season) }

  it { should have_one(:trip) }
  it { should belong_to(:season) }

  describe '#destroy' do
    before(:each) do
      @match = create(:match)
    end

    context 'there was a trip to the match' do
      before(:each) do
        create(:trip, match: @match)
      end

      it 'does not destroy trip' do
        expect { @match.destroy }.to_not change(Trip, :count)
      end

      it 'does not destroy match' do
        expect { @match.destroy }.to_not change(Match, :count)
      end
    end

    context 'there was not any trip to the match' do
      it 'destroys match' do
        expect { @match.destroy }.to change(Match, :count).from(1).to(0)
      end
    end
  end
end
