Rails.application.routes.draw do
  resources :dogs, :users, :welcome, :sessions, :walks

  resources :users do
    resources :dogs, :walks
  end

  resources :dogs do
    resources :walks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/update_dogs' => 'walks#update', :as => :update_dogs
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/login' => 'sessions#new', :as => :login
  get '/auth/github/callback' => 'sessions#create'

  # match '/update_dogs' => 'walks#crea', via: [:get, :put, :patch, :post]
  match '/login' => 'sessions#new', via: [:get, :post]
  match '/auth/user/callback' => 'sessions#create', via: [:get, :post]
  match '/auth/user/register', to: 'sessions#create', via: [:get, :post]
end
