Rails.application.routes.draw do
  root 'welcome#welcome'

  get '/signup' => 'registrations#new', :as => 'signup'
  post '/signup' => 'registrations#create'

  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => 'logout'

  get 'tags/most_popular' => 'tags#most_popular'

  resources :users, only: [:show] do
    resources :crafts, only: [:new, :create, :show, :edit, :update]
  end

  resources :crafts, only: [:index]
  resources :tags, except: [:destroy]
end
