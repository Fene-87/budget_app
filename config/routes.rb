Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :groups, path: 'categories', only: [:index, :new, :create] do
    resources :operations, path: 'transactions', only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
