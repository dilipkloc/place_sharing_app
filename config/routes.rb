Rails.application.routes.draw do
  resources :places
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'

  root 'about#index'
end
