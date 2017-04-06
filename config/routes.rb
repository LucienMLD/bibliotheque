Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :books
end
