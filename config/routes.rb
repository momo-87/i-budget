Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups, only: [:index, :new, :show, :create]
  resource :icons, only: [:new]
end
