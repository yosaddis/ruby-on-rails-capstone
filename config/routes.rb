Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'splash_screen', to: 'splash_screen#index'
  resources :category, only: %i[index new create edit update destroy] do
    resources :expense, only: %i[index new create edit update destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"

  root 'splash_screen#index'
end
