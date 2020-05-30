Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#index'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index, :show]
  resources :mood, only: [:create, :update]

  get '/all_resources', to: 'all_resources#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
