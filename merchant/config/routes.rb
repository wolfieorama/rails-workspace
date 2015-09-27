Rails.application.routes.draw do
  resources :addresses
  resources :order_items
  resources :products
  
  resources :orders do
    member do
      get :confirm
    end
  end

  # You can have the root of your site routed with "root"
   root 'products#index'

  #callback url route
   match '/auth/:provider/callback', to: 'sessions#create', via: :get

  #login and logout routes
   match "/login" => redirect("/auth/twitter"), as: :login, via: :get
   match "/logout" => "sessions#destroy", as: :logout, via: :get

end
