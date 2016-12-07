Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  resources :users, only: [:show]
  root to: 'top#home'
end
