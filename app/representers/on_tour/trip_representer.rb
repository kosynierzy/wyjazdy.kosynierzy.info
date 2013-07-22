require 'roar/representer/json'

module OnTour::TripRepresenter
  include Roar::Representer::JSON

  property :id
  property :official_number
  property :comment
  property :article_url
  property :match, extend: OnTour::MatchRepresenter
end
