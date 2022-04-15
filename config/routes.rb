Rails.application.routes.draw do

  get 'user/email'
  get 'user/password'
  resources :users
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :create, :update, :destroy]
      resources :movies, only: [:index, :create, :update, :destroy]
    end
  end
end
