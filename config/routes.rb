Rails.application.routes.draw do
  resources :pius
  devise_for :users
  resources :parties do
    collection do
      post :add_student
    end
  end
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
