Rails.application.routes.draw do
  post 'login', to: 'current_user#login'
  resources :packages
  resources :reservations
end
