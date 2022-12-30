Rails.application.routes.draw do
  root to: 'landing_page#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  
  resources :users, only: [:show, :new] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  get '/register', to: 'users#new'
  post '/users/new', to: 'users#create'
  delete '/logout', to: "users#logout_user"
end
