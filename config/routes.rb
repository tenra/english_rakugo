Rails.application.routes.draw do
  root to: 'top#home'
  
  get 'users/me' => 'users#me'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  resources :events
  
end