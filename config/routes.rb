Rails.application.routes.draw do

 

  devise_for :admins
  devise_for :users

  
  get 'profiles/edit'

  resources :rules
  resources :profiles
  resources :amenities
  resources :listings

  resources :cities do
    collection { post :import }
  end
  resources :admin_listings do
    collection { post :import }
  end
  resources :areas do
    collection { post :import }
  end


  get '/listing/:id' => "home#show" , as:'show_listing'


 
  get 'user_dashboard' => 'user_dashboard#index'
  get 'user_messages' => 'user_dashboard#messages'

  get '/admin' => 'dashboard#index'

  delete '/delpic' => "listings#delpic"

  delete '/dellistingpic' => "admin_listings#delpic"

   get 'user_dashboard'  => "user_dashboard#index", as: 'user_profile'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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