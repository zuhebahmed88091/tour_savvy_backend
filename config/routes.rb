Rails.application.routes.draw do
  resources :users, defaults: { format: 'json' }
  resources :packages, defaults: { format: 'json' }
  resources :reservations, defaults: { format: 'json' }
  post 'login', to: 'users#login', defaults: { format: 'json' }
  post 'signup', to: 'users#signup', defaults: { format: 'json' }
end