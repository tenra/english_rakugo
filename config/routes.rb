Rails.application.routes.draw do
  get 'users/me' => 'users#me'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  root to: 'top#home'
end