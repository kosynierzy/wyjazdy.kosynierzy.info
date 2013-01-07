require 'spec_helper'

describe 'routing to on tour pages' do
  it 'routes subdomain root to OnTour::Trips#index' do
    { :get => 'http://wyjazdy.kosynierzy.info/' }.should route_to(
      :controller => 'on_tour/trips',
      :action => 'index'
    )
  end
end
