Rails.application.routes.draw do
  get '/home', to: 'profile#show'
  get '/rank', to: 'ranking#show'
  get '/memo', to: 'memo#show'
  get '/record', to: 'record#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'profile#show'
end
