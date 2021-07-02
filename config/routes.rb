Rails.application.routes.draw do
  post '/search_by_name', to: 'characters#search_by_name'
  post '/search_by_id', to: 'characters#search_by_id'
  resources :characters, only: [:index, :show, :create, :destroy]

  resources :users

  resources :comments, only: [:index, :create, :update, :destroy]
  
  resources :likes, only: [:index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

