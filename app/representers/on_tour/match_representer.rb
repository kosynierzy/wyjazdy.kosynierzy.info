require 'roar/json'

module OnTour::MatchRepresenter
  include Roar::JSON

  property :id
  property :season, extend: OnTour::SeasonRepresenter
  property :date
  property :home_score
  property :away_score
  property :home_team
  property :away_team
  property :game_type
  property :stats_url
end
