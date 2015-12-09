Rails.application.routes.draw do
  mount RailsSso::Engine => "/sso", as: "sso"

  scope module: "on_tour" do
    resources :matches
    resources :trips, only: [:index], format: :json do
      post :presence
      delete :absence
    end

    root to: "trips#index", as: :on_tour
  end

  root to: "on_tour/trips#index"

end
