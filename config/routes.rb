Rails.application.routes.draw do
  get 'bets/index'
  get 'bets/show'
  get 'videos/show'
  devise_for :users
  resources :users, path:  'custom/user', :only => [:show]
  resources :user_combats
  resources :combats
  resources :comptes
end
