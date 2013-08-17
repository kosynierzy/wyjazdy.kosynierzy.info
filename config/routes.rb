Kosynierzy::Application.routes.draw do
  constraints subdomain: 'account' do
    devise_for :users

    devise_scope :user do
      authenticated :user do
        root to: 'devise/registrations#edit', as: :authenticated_user
      end

      root to: 'devise/sessions#new', as: :guest_user
    end
  end

  constraints subdomain: 'wyjazdy' do
    scope module: 'on_tour' do
      resources :matches
      resources :trips, only: [:index], format: :json do
        post :presence
        delete :absence
      end

      root to: 'trips#index', as: :on_tour
    end
  end

  root to: 'on_tour/trips#index'

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404', via: [:get, :post]
  end
end
