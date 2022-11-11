Rails.application.routes.draw do
  root "home#index"
  resource :session , only: [:new, :create, :destroy]
  resources :posts do
    resources :comments
  end
  resources :authors
  get "signup" => "authors#new"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end