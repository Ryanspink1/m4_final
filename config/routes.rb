Rails.application.routes.draw do
  root to: 'home#show', as: 'root'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  root to: "links#index"

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
