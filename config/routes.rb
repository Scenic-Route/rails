Rails.application.routes.draw do

  root to: "users#index"
  get 'users/destroy', to: 'users#destroy'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                   controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions", registrations: "registrations"}

    # routes for users
  patch 'users/edit', to: 'users#edit'
  get 'users/show', to: 'users#show'

    # routes for profiles
  get '/profiles', to: 'profiles#show'
  patch '/profiles', to: 'profiles#edit'

    # routes for stat trackers
  get '/stat_trackers', to: 'stat_trackers#show'
  patch '/stat_trackers', to: 'stat_trackers#edit'

    # routes for routes
  get '/routes/:id', to: 'routes#show'
  patch '/routes/:id', to: 'routes#edit'
  post '/routes', to: 'routes#create'
  delete '/routes/:id', to: 'routes#destroy'
  post '/routes/search', to: 'routes#search'
  get '/routes/:id/ratings', to: 'routes#route_ratings'

    # routes for ratings

  post '/ratings', to: 'ratings#create' 
  get '/ratings', to: 'ratings#show'
  patch '/ratings/:id', to: 'ratings#edit'
  delete '/ratings/:id', to: 'ratings#destroy'
  





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
