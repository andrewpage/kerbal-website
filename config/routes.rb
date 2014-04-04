Kerbalsite::Application.routes.draw do
  devise_for :accounts, path: 'auth'

  resources :accounts

  match 'contact', to: 'pages#contact', via: 'get'

  root to: 'pages#home'
end
