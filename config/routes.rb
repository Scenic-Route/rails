Rails.application.routes.draw do

  root to: "users#index"
  get '/users/destroy', to: 'users#destroy'

      # routes for users
  patch '/users/edit', to: 'users#edit'
  get '/users/show', to: 'users#show'
  post '/users/edit_username', to: 'users#edit_username'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                   controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions", registrations: "registrations"}


    # routes for profiles
  get '/profiles/:id', to: 'profiles#show'
  patch '/profiles', to: 'profiles#edit'

    # routes for stat trackers
  get '/stat_trackers', to: 'stat_trackers#show'
  patch '/stat_trackers', to: 'stat_trackers#edit'

    # routes for routes... hardee har har
  get '/routes', to: 'routes#my_routes'
  post '/routes', to: 'routes#create'
  post '/routes/search', to: 'routes#search'
  get '/routes/:id', to: 'routes#show'
  patch '/routes/:id', to: 'routes#edit'
  delete '/routes/:id', to: 'routes#destroy'
    # to get all ratings on a route
  get '/routes/:id/ratings', to: 'routes#route_ratings'
    # to get all waypoints on a route
  get '/routes/:id/waypoints', to: 'waypoints#route_waypoints'
    # to get all comments on a route
  get '/routes/:id/comments', to: 'comments#route_comments'
    # to get all interest points on a route
  get '/routes/:id/interest_points', to: 'interest_points#route_points'

    # routes for ratings
  post '/ratings', to: 'ratings#create' 
  patch '/ratings/:id', to: 'ratings#edit'
  delete '/ratings/:id', to: 'ratings#destroy'

    # routes for check-ins
  post '/checkins', to: 'checkins#create'
  get '/checkins', to: 'checkins#my_checkins'


    # routes for waypoints
  get '/waypoints/:id', to: 'waypoints#show'
  get '/waypoints', to: 'waypoints#my_waypoints'
  post '/waypoints', to: 'waypoints#create'
  patch '/waypoints/:id', to: 'waypoints#edit'
  delete '/waypoints/:id', to: 'waypoints#destroy'


    # routes for favorites
  get '/favorites', to: 'favorites#my_favorites'
  post '/favorites', to: 'favorites#create'
  patch '/favorites/:id', to: 'favorites#edit'
  delete '/favorites/:id', to: 'favorites#destroy'


    # routes for comments
  get '/comments', to: 'comments#my_comments'
  post '/comments', to: 'comments#create'
  patch '/comments/:id', to: 'comments#edit'
  delete '/comments/:id', to: 'comments#destroy'

    # routes for interest points

  post '/interest_points', to: 'interest_points#create'
  patch '/interest_points/:id', to: 'interest_points#edit'
  delete '/interest_points/:id', to: 'interest_points#destroy'












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
