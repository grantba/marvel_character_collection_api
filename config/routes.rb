Rails.application.routes.draw do
  post '/search_by_name', to: 'characters#search_by_name'
  post '/search_by_id', to: 'characters#search_by_id'
  resources :characters

  resources :comments
  resources :likes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

