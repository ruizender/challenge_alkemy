Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :characters, only: [:create, :update, :destroy]
      resources :movies, only: [:create, :update, :destroy]
    end
  end
end
