Rails.application.routes.draw do
  get 'ranking/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ranking#show'
end
