Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  patch '/users' => 'users#update'
  delete '/users' => 'users#destroy'

  get '/addresses' => 'addresses#index'
  post '/addresses' => 'addresses#create'
  patch '/addresses' => 'addresses#update'
  delete '/addresses' => 'addresses#destroy'  

  get '/posts' => 'posts#index'
  post '/posts' => 'posts#create'
  patch '/posts' => 'posts#update'
  delete '/posts' => 'posts#destroy'

  get '/threads' => 'threads#index'
  post '/threads' => 'threads#create'
  patch '/threads' => 'threads#update'
  delete '/threads' => 'threads#destroy' 

  get '/places' => 'places#index'
end
