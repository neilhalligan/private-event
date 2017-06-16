Rails.application.routes.draw do
  root to: 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
  resources :attendances, only: [:create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
