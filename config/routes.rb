Rails.application.routes.draw do
  root to: 'top#home'
  get "about" => "top#about", as: "about"
  post 'top/confirm' => 'top#confirm' #確認画面
  post 'top/thanks' => 'top#thanks' #送信完了画面
  
  get 'users/me' => 'users#me'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }
  
  resources :events do
    resource :bookings, only: [:create, :destroy]
  end
  
  resources :profiles
  
end