Kerbalsite::Application.routes.draw do
  devise_for :accounts, path: 'auth'

  resources :accounts

  resources :mods, except: [:index] do
    member do
      get :download
      get :subscribe
      get :like
      get :dislike
    end
  end

  get 'mods', to: 'mods#index', mod_type: 'plugin'
  get 'crafts', to: 'mods#index', mod_type: 'craft'
  get 'parts', to: 'mods#index', mod_type: 'part'

  resources :pages, path: '/', only: [] do
    collection do
      get :home
      get :contact
      get :faq
      get :search
    end
  end

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
  end

  root to: 'pages#home'
end
