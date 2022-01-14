Rails.application.routes.draw do

  root 'static_pages#home'
  namespace :admin do
    resources :combats, only: [:new, :edit, :create, :destroy, :index]
    resources :bets, only: [:index, :show, :destroy]
    resources :users, :only => [:index, :show, :edit]
    end
  resources :bets
  get 'videos/show'
  devise_for :users
  resources :users, path:  'custom/user', :only => [:show]
  resources :user_combats
  resources :combats
  resources :comptes
end
