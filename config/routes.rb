Rails.application.routes.draw do

  root 'welcome#index'

  get '/login', to: 'sessions#index'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
