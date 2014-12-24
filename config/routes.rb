Rails.application.routes.draw do
  
  devise_for :admins
  get 'ajax/get_hotels'
  get 'ajax/get_rooms'
  get 'ajax/submit'
  post 'ajax/book'

  get 'admin/cities/index', as: 'user_root'

  get "/rooms/:room_id/booking" => "bookings#booking"
	get '/rooms/book' => 'rooms#book'
  
  

  namespace :admin do
    resources :cities do
      resources :hotels, shallow: true do
        resources :rooms, shallow: true do
          resources :bookings, shallow: true
        end
      end
    end
  end

  # resources :bookings

	root 'bookings#book'
	

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
