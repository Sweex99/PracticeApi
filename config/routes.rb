Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      namespace :order do
        resources :orders
      end
      namespace :item do
        resources :items
      end
      namespace :item_order do
        resources :item_orders
      end
    end
  end
end
