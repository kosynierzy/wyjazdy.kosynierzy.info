require 'roar/representer/json'

module OnTour::TripRepresenter
  include Roar::Representer::JSON

  property :id
  property :official_number
  property :comment
  property :article_url
  property :match, extend: OnTour::MatchRepresenter
  property :presence, getter: lambda { |opts|
    !!current_user_presence(opts[:current_user])
  }

  def current_user_presence(user)
    user && user.trips.include?(self)
  end
end
