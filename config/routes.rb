Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "/auth/github/callback" => "authentications#create"
  # or "/auth/:provider/callback" for more than one third party authenticator
  resources :users, except: [:index, :new]
  resources :sessions, except: [:index, :edit, :update, :show, :new, :destroy]
  resources :categories do
    resources :habits do
      resources :entries
    end
  end
  resources :habits do
    resources :entries
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "sites#index"
end
