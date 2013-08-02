class OnTour::MatchesController < ApplicationController
  respond_to :html

  expose(:matches)
  expose(:match, attributes: :match_params)

  def new
    match.build_trip

    respond_with match
  end

  def create
    match.save

    respond_with match, location: root_path(subdomain: 'wyjazdy')
  end

  private

  def match_params
    params.require(:match).permit(:away_score, :away_team, :date, :game_type, :home_score, :home_team, :season_id, :won, {trip_attributes: [:article_url, :comment, :official_number]}, :stats_url)
  end
end
