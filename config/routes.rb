Rails.application.routes.draw do

  get 'user/email'
  get 'user/password'
  resources :users
    namespace :api do
      namespace :v1 do
        post :users, to: 'users#create'
        get :users, to: 'users#index'
        post :login, to: 'auth#create'
        resources :characters, only: [:index, :show, :create, :update, :destroy]
        resources :movies, only: [ :show, :create, :update, :destroy]
        get '/GET/movies', to: 'movies#index'
      end
  end
end
