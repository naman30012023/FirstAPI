Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/index' => 'article#index'
  get '/show/:id' => 'article#show'
  get '/findByCategory' => 'article#findByCategory'
  get '/partialSearch' => 'article#partialTitle'
  get '/dateFilter'  => 'article#dateRangeFilter'
  post '/create' => 'article#create'
  post '/login' => 'authentication#login'
  post '/createUser' => 'users#create'
  delete '/deleteById' => 'article#deleteById'
  delete '/deleteByTitle' => 'article#deleteByTitle'
  put '/update' => 'article#update'
end
