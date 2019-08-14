Rails.application.routes.draw do
  namespace :users, path: "/" do 
    root to: 'home_pages#index'
  end
end
