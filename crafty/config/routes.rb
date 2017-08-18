Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#welcome'

  get '/signup' => 'registrations#new', :as => 'signup'
  post '/signup' => 'registrations#create'

  get '/login' => 'sessions#new', :as => 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => 'logout'

  resources :crafts
end
