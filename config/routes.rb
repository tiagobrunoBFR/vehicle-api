Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'vehicles', to: 'vehicle#create'
      put 'vehicles/:id', to: 'vehicle#update'
      delete 'vehicles/:id', to: 'vehicle#destroy'
      get 'vehicles/:id', to: 'vehicle#show'
      get 'vehicles', to: 'vehicle#list'
    end
  end

end
