Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      post '/sessions' => 'sessions#create'
      delete '/sessions' => 'sessions#destroy'
    end
    resource :users, only: [:create, :show, :update, :destroy] do
      get 'ability' => 'users#ability'
      get 'roles' => 'users#roles'
      put 'change_password'
    end
    namespace :admin do
      resource :admin, only: []
      resources :users, only: [:index, :create, :update, :destroy]
      # get 'users' => 'admin#users'
      # put 'users' => 'admin#update_user'
      # delete 'users/:id' => 'admin#delete_user'
    end
    resources :fermenters, only: [] do
      post :set_fermenter_state
    end
    match 'fermenters/sort' => 'fermenters#sort', :via => 'post'
    resources :batches do
      resources :batch_readings
      resources :comments
      resources :batch_processes

      resources :batch_bottle_settings, only:[:index, :show]
      match 'batch_bottle_settings/update_quantity' => 'batch_bottle_settings#update_quantity', :via => 'put'
      resources :batch_carbonation_settings, only:[:index, :show]
      match 'batch_carbonation_settings/update_quantity' => 'batch_carbonation_settings#update_quantity', :via => 'put'

      match 'batch_processes/start_batch_process' => 'batch_processes#start_batch_process', :via => 'post'
      match 'batch_processes/end_batch_process' => 'batch_processes#end_batch_process', :via => 'post'
      put :set_inventories
      post :set_batch_state
      member do
        put :add_comment
      end
    end
    resources :flavors, only: [:index]

    resources :inventories do
      put :update_quantity
    end
  end

  root 'application#index'
  get '*path' => 'application#index'


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
