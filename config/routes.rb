Rails.application.routes.draw do
  resources :bets
  get 'videos/show'
  devise_for :users
  resources :users, path:  'custom/user', :only => [:show]
  resources :user_combats
  resources :combats
  resources :comptes
end
