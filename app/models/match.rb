class Match < ActiveRecord::Base
  belongs_to :season
  has_one :trip, inverse_of: :match
  accepts_nested_attributes_for :trip

  attr_accessible :away_score, :away_team, :date, :game_type, :home_score, :home_team, :season_id, :won, :trip_attributes, :stats_url

  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :date, presence: true
  validates :season, presence: true
  validates :game_type, presence: true
end
