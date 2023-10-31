Rails.application.routes.draw do
  get 'set_current_user', to: 'current_user#index'
  resources :packages
  resources :reservations
end
