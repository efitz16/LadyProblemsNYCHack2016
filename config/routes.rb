Rails.application.routes.draw do

root 'search#index'

resources :users, except: [:index]

resources :entries, except: [:show]

resources :entries, only: [:show] do
  resources :bills, except: [:index]

resources :bills, only: [:show] do
  resources :items, except: [:index, :show]
end

resources :searches, :only => [:show, :index]

end
