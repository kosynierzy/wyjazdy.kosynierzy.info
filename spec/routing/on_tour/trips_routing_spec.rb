require 'spec_helper'

describe 'on tour trips routes' do
  it 'routes subdomain root to OnTour::Trips#index' do
    expect({ get: 'http://wyjazdy.kosynierzy.info/' }).to route_to(
      subdomain: 'wyjazdy',
      controller: 'on_tour/trips',
      action: 'index'
    )
  end

  it 'routes presence to OnTour::Trips#presence' do
    expect({ post: 'http://wyjazdy.kosynierzy.info/trips/id/presence' }).to route_to(
      subdomain: 'wyjazdy',
      controller: 'on_tour/trips',
      action: 'presence',
      trip_id: 'id'
    )
  end

  it 'routes absence to OnTour::Trips#absence' do
    expect({ delete: 'http://wyjazdy.kosynierzy.info/trips/id/absence' }).to route_to(
      subdomain: 'wyjazdy',
      controller: 'on_tour/trips',
      action: 'absence',
      trip_id: 'id'
    )
  end
end
