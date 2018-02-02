Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  delete '/users/:id' => 'users#destroy'

  get '/user_actions' => 'user_actions#index'
  post '/user_actions' => 'user_actions#create'

  get '/locations' => 'locations#index'
  get '/locations/new' => 'locations#new'
  post '/locations' => 'locations#create'
  get '/locations/:id' => 'locations#show'
  get '/locations/:id/edit' => 'locations#edit'
  patch '/locations/:id' => 'locations#update'
  delete '/locations/:id' => 'locations#destroy'  

  get '/posts' => 'posts#index'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  patch '/posts' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/threads' => 'threads#index'
  post '/threads' => 'threads#create'
  get '/threads/:id' => 'threads#show'
  patch '/threads' => 'threads#update'
  delete '/threads/:id' => 'threads#destroy' 

  get '/places' => 'places#index'
end
