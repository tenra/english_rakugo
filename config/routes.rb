Rails.application.routes.draw do

  scope "(:locale)" do
      root to: 'top#home'
      get "about" => "top#about", as: "about"
      post 'top/confirm' => 'top#confirm' #確認画面
      post 'top/thanks' => 'top#thanks' #送信完了画面
      
      get 'users/me' => 'users#me'
      get '/users/:user_id/show', to: 'users#show', as: 'show_user'
      resources :users, only: [:destroy]
      
      get 'events/:event_id/show', to: 'events#show', as: 'show_event'
      
      scope :admin do
        resources :events, except: [:show, :index] do
          member do
            post 'confirm2'
          end
        end
        post 'events/confirm', to: 'events#confirm'
        # post 'events/confirm2', to: 'events#confirm2'
        resources :timetables
      end
      
      get 'admin/dashboard'
      get 'admin/users'
      get 'admin/events'
      
      resources :events, only: [:show, :index] do
        member do
          get "ticket" => "events#ticket"
        end
        resource :bookings, only: [:create, :destroy]
      end
      
      resources :profiles
  end
  
    devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }
  
end