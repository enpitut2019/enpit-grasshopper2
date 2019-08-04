Rails.application.routes.draw do
  get '/home', to: 'profile#show'
  get '/rank', to: 'ranking#show'
  get '/memos', to: 'memo#show'
  get '/records', to: 'records#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'profile#show'

end
