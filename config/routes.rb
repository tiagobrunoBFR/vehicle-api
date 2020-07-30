Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post :vehicles, to: 'vehicle#create'
    end
  end

end
