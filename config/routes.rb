Rails.application.routes.draw do

  get 'users/new'
  get 'sessions/new'
  
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'login' =>'sessions#new'
  get '/home', to: 'profile#show'  
  #post '/home', to: 'profile#show'
  post '/home', to:'profile#set_record'
  
  get '/rank', to: 'ranking#show'
  get '/memo', to: 'memo#show'
  get  '/creatememo',  to: 'memo#new'
  post '/creatememo', to: 'memo#create'
  get '/record', to: 'record#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :profile
  resources :record
  resources :memo
end
