Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'vehicles', to: 'vehicle#create'
      put 'vehicles/:id', to: 'vehicle#update'
    end
  end

end
