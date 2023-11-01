Rails.application.routes.draw do
  post 'login', to: 'current_user#login'
  post 'register', to: 'current_user#create'
  resources :packages
  resources :reservations
end
