Rails.application.routes.draw do
  root 'welcome#welcome'

  get '/signup' => 'registrations#new', :as => 'signup'
  post '/signup' => 'registrations#create'

  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => 'logout'

  resources :users, only: [:edit, :update, :show] do
    resources :crafts, only: [:new, :create, :show, :edit, :update]
  end

  resources :crafts, only: [:index]
  resources :tags, except: [:destroy]
end
