Rails.application.routes.draw do
  get 'main/login'
  get 'main/create'
  get '/login' , to: "main#login"
  post 'main/create'
  resources :markets
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end