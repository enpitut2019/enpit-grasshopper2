Rails.application.routes.draw do
  get 'sessions/new'
  get 'profile/show'
  get 'ranking/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'profile#show'
  #root 'ranking#show'
  get 'login' =>'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
