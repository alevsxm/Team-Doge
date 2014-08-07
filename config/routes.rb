Rails.application.routes.draw do

  root 'linkedins#home'
  get '/welcome' => 'linkedins#index', as: :generate
  get '/accept' => 'linkedins#accept'

  resources :users, :resovisions, :positions, :educations

  # Sessions
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy', as: :logout

end
