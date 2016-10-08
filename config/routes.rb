Rails.application.routes.draw do
<<<<<<< HEAD

root 'search#index'

resources :users, except: [:index]

resources :entries, except: [:show]

resources :entries, only: [:show] do
  resources :bills, except: [:index]

resources :bills, only: [:show] do
  resources :items, except: [:index, :show]
end

resources :searches, :only => [:show, :index]
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :searches, :only => [:show, :index]
>>>>>>> created bill and item forms
end
