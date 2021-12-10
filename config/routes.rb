Rails.application.routes.draw do
 resources :user_combats
  resources :combats
  devise_for :users
  resources :comptes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
