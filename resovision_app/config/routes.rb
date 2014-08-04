Rails.application.routes.draw do

  root 'welcome#index'
  get '/accept' => 'welcome#accept'

  resources :users, :resovisions, :positions, :educations

  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
