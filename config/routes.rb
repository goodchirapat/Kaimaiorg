Rails.application.routes.draw do
  get 'main/login'
  get 'main/create'
  get '/login' , to: "main#login"
  post 'main/create'
  get '/main'  , to: "main#menu"
  post '/main' , to: "main#menu"
  post '/profile' ,to: "main#profile"
  get '/profile' ,to: "main#profile"
  post "/main/change_password" ,to: "main#change_password"
  resources :markets
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end