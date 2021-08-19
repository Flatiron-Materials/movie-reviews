Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :reviews
  resources :movies, only: [:index, :new, :create, :show]
  resources :users

  get '/', to:'static#index'

  post '/', to:'sessions#create'

  get '/logout', to:'sessions#destroy'
  
end
