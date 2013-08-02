require 'spec_helper'

describe 'routing to on tour pages' do
  it 'routes subdomain root to OnTour::Trips#index' do
    expect({ :get => 'http://wyjazdy.kosynierzy.info/' }).to route_to(
      :subdomain => 'wyjazdy',
      :controller => 'on_tour/trips',
      :action => 'index'
    )
  end
end
