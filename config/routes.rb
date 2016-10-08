Rails.application.routes.draw do
  root 'searches#index'

  get '/login', to: "sessions#new"
  
  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:index]

  resources :entries, except: [:show]

  resources :entries, only: [:show] do
    resources :bills, except: [:index]
  end

  resources :bills, only: [:show] do
    resources :items, except: [:index, :show]
  end

  resources :searches, :only => [:show, :index, :new]

end
