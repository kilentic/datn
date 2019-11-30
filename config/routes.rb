Rails.application.routes.draw do
  namespace :user_controllers, path: "/" do 
    root to: 'home_pages#index'
    get  '/show',    to: 'home_pages#show'
    namespace :authentications do 
      resource :registrations, only: [:new, :create]
      resource :sessions, only: [:new, :create, :destroy]
    end
  end
end
