Rails.application.routes.draw do
  namespace :user_controllers, path: "/" do 
    root to: 'home_pages#index'
  end
end
