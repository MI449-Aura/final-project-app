Rails.application.routes.draw do
  get "user_info/index"
  resource :session
  resources :passwords, param: :token

  get "/user_infos", to: "user_infos#index"

  get "/user_infos/new", to: "user_infos#new"
  post "/user_infos", to: "user_infos#create"

  get "/user_infos/:id", to: "user_infos#show"

  get "/user_infos/:id/edit", to: "user_infos#edit"
  patch "/user_infos/:id", to: "user_infos#update"
  put "/user_infos/:id", to: "user_infos#update"

  delete "/user_infos/:id", to: "user_infos#destroy"

  get "/user_info/all-recipes", to: "user_info#all-recipes"
  get "/user_info/disorders", to: "user_info#disorders"
  get "/user_info/resources", to: "user_info#resources"
  get "/user_info/about", to: "user_info#about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "user_info#index"
  resources :user_infos
end
