Rails.application.routes.draw do
  resources :pius
  devise_for :users
  resources :parties
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
