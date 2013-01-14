require 'spec_helper'

describe 'routing to seasons pages' do
  it 'routes with season years to OnTour::Seasons#show' do
    { :get => 'http://wyjazdy.kosynierzy.info/seasons/2000/01' }.should route_to(
      :controller => 'on_tour/seasons',
      :action => 'show',
      :id => '2000/01'
    )
  end
end
