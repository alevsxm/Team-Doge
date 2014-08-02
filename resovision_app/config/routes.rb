Rails.application.routes.draw do
  get 'welcome/index'

  #users
  get 'users/:id' => 'users#show'

  #resources
  get 'resovisions' => 'resovisions#index'
  get 'resovisions/:id/edit' => 'resovisions#edit'
  get 'resovisions/:id' => 'resovisions#show'

end
