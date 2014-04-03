Kerbalsite::Application.routes.draw do
  match 'contact', to: 'pages#contact', via: 'get'

  root to: 'pages#home'
end
