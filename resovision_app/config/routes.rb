Rails.application.routes.draw do

  get('/' => 'welcome#index', as: 'root')
  resources :users, :resovisions

  #Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
