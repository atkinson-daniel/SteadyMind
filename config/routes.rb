Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#index'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index, :show]
  resources :mood, only: [:create, :update]

  namespace :all_resources do
    resources :yoga, only: [:index]
    resources :meditation, only: [:index]
    resources :motivational, only: [:index]
  end

  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
