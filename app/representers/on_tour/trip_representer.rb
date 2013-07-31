require 'roar/representer/json'

module OnTour::TripRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

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

  link :presence do
    trip_presence_path(self, subdomain: 'wyjazdy', format: 'json')
  end

  link :absence do
    trip_absence_path(self, subdomain: 'wyjazdy', format: 'json')
  end
end
