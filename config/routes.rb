Rails.application.routes.draw do

  get 'user/email'
  get 'user/password'
  resources :users
    namespace :api do
      namespace :v1 do
        resources :characters, only: [:index, :show, :create, :update, :destroy]
        resources :movies, only: [ :show, :create, :update, :destroy]
        get '/GET/movies', to: 'movies#index'
      end
  end
end
