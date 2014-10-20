SampleApp::Application.routes.draw do
  
  get "carts/show"
  get "carts/destroy"
  get "cart_items/new"
  get "cart_items/create"
  get "cart_items/show"
  post "cart_items/destroy"
  post "cart_items/delete_one_item"
  get "cart_items/index"
  get "specialities/new"
  get "specialities/create"
  get "specialities/show"
  get "specialities/index"
  get "specialities/destroy"
  get "items/new"
  get "items/create"
  get "items/show"
  get "items/index"
  get "items/destroy"
  #get "menus/new"
  #get "menus/create"
  #get "menus/show"
  #get "menus/index"
  #get "menus/destroy"
  get "vendors/new"
  get "vendors/create"
  get "vendors/show"
  get "vendors/index"
  get "vendors/destroy"
  root "static_pages#home"
  
  resources :carts
  resources :users do
    resources :carts, only: [:show, :destroy, :clear]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :vendors do 
    resources :menus do
      resources :items do
        resources :cart_items
      end
    end
    resources :specialities
  end

  resources :specialities

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

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
