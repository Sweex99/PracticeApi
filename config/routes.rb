Rails.application.routes.draw do
  apipie
  namespace :v1 do
    resources :contacts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users  do
    resources :sessions, only: [:create]
  end
end
