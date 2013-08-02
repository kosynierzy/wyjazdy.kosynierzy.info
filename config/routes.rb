Kosynierzy::Application.routes.draw do
  constraints :subdomain => 'account' do
    devise_for :users

    devise_scope :user do
      authenticated :user do
        root :to => 'devise/registrations#edit', as: :authenticated_user
      end

      root :to => 'devise/sessions#new', as: :guest_user
    end
  end

  constraints :subdomain => 'wyjazdy' do
    scope :module => 'on_tour' do
      resources :matches
      resources :seasons,
        :only => [:show],
        :constraints => { :id => /\d{4}\/\d{2}/ }
      resources :trips, :only => [:index] do
        post :presence
        delete :absence
      end

      root :to => 'trips#index', as: :on_tour
    end
  end

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => 'on_tour/trips#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
