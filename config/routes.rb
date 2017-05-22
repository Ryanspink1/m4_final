Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :index, :update]
    end
  end
end
