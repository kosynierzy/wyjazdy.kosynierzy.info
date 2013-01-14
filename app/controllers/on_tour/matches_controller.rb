class OnTour::MatchesController < ApplicationController
  respond_to :html

  expose(:matches)
  expose(:match)

  def new
    match.build_trip

    respond_with match
  end

  def create
    match.save

    respond_with match, location: root_path(subdomain: 'wyjazdy')
  end
end
