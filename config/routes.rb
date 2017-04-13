Rails.application.routes.draw do

  scope "(:locale)" do
      root to: 'top#home'
      get "about" => "top#about", as: "about"
      post 'top/confirm' => 'top#confirm' #確認画面
      post 'top/thanks' => 'top#thanks' #送信完了画面
      get "terms_of_service" => "top#terms_of_service"
      
      get 'users/me' => 'users#me'
      get '/users/:user_id/show', to: 'users#show', as: 'show_user'
      delete 'delete_users/:id' => 'users#destroy', as: :delete_user
      
      get 'events/:event_id/show', to: 'events#show', as: 'show_event'
      
      scope :organizer do
        resources :events, except: [:show, :index] do
          member do
           post 'confirm', to: 'events#confirm'
           post 'confirm2', to: 'events#confirm2'
          end
        end
        resources :timetables
      end
      
      get "organizer/events" => "users#organizer", as: "organizer"
      get "organizer/blogs" => "users#blogs", as: "blogs"
      
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
      get 'admin/events/:event_id/participants', to: 'admin#participants', as: 'admin_participants'
      
      resources :events, only: [:show, :index] do
        member do
          get "ticket" => "events#ticket"
        end
        resource :bookings, only: [:create, :destroy]
        member do
          get "charge" => "bookings#charge"
          post "pay" => "bookings#pay"
        end
      end
      
      resources :profiles
      
      get "spots/test"
  end
  
    devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }
  
end