require 'spec_helper'

describe Match do
  it { should validate_presence_of(:home_team) }
  it { should validate_presence_of(:away_team) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:game_type) }
  it { should validate_presence_of(:season) }

  it { should have_one(:trip) }
end
