Kerbalsite::Application.routes.draw do
  devise_for :accounts, path: 'auth'

  resources :accounts

  resources :mods do
  end

  match 'contact', to: 'pages#contact', via: 'get'
  match 'search', to: 'pages#search', via: 'get'

  root to: 'pages#home'
end
