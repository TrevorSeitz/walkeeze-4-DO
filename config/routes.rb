Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/login' => 'sessions#new', :as => :login
  get '/auth/github/callback' => 'sessions#create'

  match '/login' => 'sessions#new', via: [:get, :post]
  match '/auth/user/callback' => 'sessions#create', via: [:get, :post]
  match '/auth/user/register', to: 'sessions#create', via: [:get, :post]
end
