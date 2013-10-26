Wedoo::Application.routes.draw do

  root 'home#index'

  # ATENCION: "devise_for :users" debe ir antes de "resources :users" !
  devise_for :users
  resources :users

  resources :ongs, only: :show do
    resources :adword_auths do
      get 'create_token', on: :collection
      match 'select_accounts', on: :collection, via: [:get, :post]
    end
    resources :initiatives do
      get 'toggle_signs_active', on: :member
      match 'toggle_spam_active', on: :member, via: [:get, :patch]
      get 'toggle_donations_active', on: :member
      resources :signs, only: [:new, :create, :index]
      resources :campaigns
      
      resources :donations do 
        get 'thanks', on: :collection
        get 'no_thanks', on: :collection
      end
    end
    resources :paypal_apps
  end





  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
