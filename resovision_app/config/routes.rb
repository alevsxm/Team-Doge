Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, :resovisions, :positions, :educations

  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  # #users
  # get 'users/:id' => 'users#show'
  #
  # #resovisions
  # get 'resovisions' => 'resovisions#index'
  # get 'resovisions/:id/edit' => 'resovisions#edit'
  # get 'resovisions/:id' => 'resovisions#show'

end
