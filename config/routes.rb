Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :books
  resources :bookings, except: :destroy
  delete    'bookings', to: 'bookings#destroy'
end
