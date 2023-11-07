Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users, defaults: { format: 'json' }
  resources :packages, defaults: { format: 'json' }
  resources :reservations, defaults: { format: 'json' }
  post 'login', to: 'users#login', defaults: { format: 'json' }
  post 'signup', to: 'users#signup', defaults: { format: 'json' }
end