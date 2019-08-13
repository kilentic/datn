Rails.application.routes.draw do
  scope module: :users do
    root to: 'home_pages#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
