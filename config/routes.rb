Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        post :users, to: 'users#create'
        get :users, to: 'users#index'
        post :login, to: 'auth#create'
        get :characters, to: 'characters#search_characters'
        get :characters_list, to: 'characters#index'
        resources :characters, only: [:show, :create, :update, :destroy]
        get :movies_list, to: 'movies#index'        
        get :movies, to: 'movies#search_movies'
        resources :movies, only: [:show, :create, :update, :destroy]
      end
  end
end