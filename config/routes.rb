Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods
  get 'recipes/new', to: 'recipes#new' 
  post 'recipes/new', to: 'recipes#create' 
  resources :recipes, except: [:new]

  # Defines the root path route ("/")
  # root "articles#index"
end
