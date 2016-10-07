Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'entries#index' #delete this
  resources :entries, :only => [:show, :index]
  resources :searches, :only => [:show, :index]
end
