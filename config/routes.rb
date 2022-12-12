Rails.application.routes.draw do
  get 'main/login'
  get 'main/create'
  get '/login' , to: "main#login"
  post 'main/create'
  get '/main'  , to: "main#menu"
  post '/main' , to: "main#menu"
  get 'main/buy_qty' , to: 'main#buy_qty'
  post 'main/buy'
  post '/profile' ,to: "main#profile"
  get '/profile' ,to: "main#profile"
  post '/my_market' ,to: "main#my_market"
  get '/my_market' ,to: "main#my_market"
  post '/purchase_history' ,to: "main#purchase_history"
  get '/purchase_history' ,to: "main#purchase_history"
  post '/sale_history' ,to: "main#sale_history"
  get '/sale_history' ,to: "main#sale_history"
  post '/my_inventory' ,to: "main#my_inventory"
  get '/my_inventory' ,to: "main#my_inventory"
  post '/top_seller' ,to: "main#top_seller"
  post 'main/top_seller'
  get '/top_seller_filter' ,to: "main#top_seller_filter"
  get '/top_seller' ,to: "main#top_seller"
  
  
  
  post "/main/change_password" ,to: "main#change_password"
  
  resources :markets
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end