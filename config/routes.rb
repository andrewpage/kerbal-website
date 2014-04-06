Kerbalsite::Application.routes.draw do
  devise_for :accounts, path: 'auth'

  resources :accounts

  resources :mods do
    member do
      get :download
      get :subscribe
    end
  end

  resources :pages, path: '/', only: [] do
    collection do
      get :home
      get :contact
      get :faq
      get :search
    end
  end

  root to: 'pages#home'
end
