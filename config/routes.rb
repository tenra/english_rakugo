Rails.application.routes.draw do
  scope "(:locale)" do
      root to: 'top#home'
      get "about" => "top#about", as: "about"
      post 'top/confirm' => 'top#confirm' #確認画面
      post 'top/thanks' => 'top#thanks' #送信完了画面
      
      get 'users/me' => 'users#me'
      
      get 'events/:event_id/show', to: 'events#show', as: 'show_event'
      
      scope :admin do
        resources :events, except: [:show, :index] do
          member do
            post 'confirm2'
          end
        end
        post 'events/confirm', to: 'events#confirm'
        # post 'events/confirm2', to: 'events#confirm2'
      end
      
      get 'admin/dashboard'
      get 'admin/users'
      get 'admin/events'
      
      resources :events, only: [:show, :index] do
        resource :bookings, only: [:create, :destroy]
      end
      
      resources :profiles
  end
  
    devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }
  
end