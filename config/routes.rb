Rails.application.routes.draw do
  get 'compte/index'
  get 'compte/show'
  get 'index/show'
  resources :combats
  devise_for :users
  resources :comptes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
