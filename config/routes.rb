Kerbalsite::Application.routes.draw do
  devise_for :accounts, path: 'auth'

  match 'contact', to: 'pages#contact', via: 'get'

  root to: 'pages#home'
end
