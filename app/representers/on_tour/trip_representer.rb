require 'roar/json'

module OnTour::TripRepresenter
  include Roar::JSON
  include Roar::JSON::HAL::Links

  property :id
  property :official_number
  property :comment
  property :article_url
  property :match, extend: OnTour::MatchRepresenter
  property :presence, getter: lambda { |opts|
    user_presence(opts[:user_id])
  }

  def user_presence(id)
    participants.include?(id)
  end

  link :presence do
    trip_presence_path(self, subdomain: 'wyjazdy', format: 'json')
  end

  link :absence do
    trip_absence_path(self, subdomain: 'wyjazdy', format: 'json')
  end
end
