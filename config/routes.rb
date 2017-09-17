Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/user', to: 'user#create'
  get '/user/:username', to: 'user#show'
end
