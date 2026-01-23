Rails.application.routes.draw do
  root "events#index"
  resources :events do
    resources :registrations
  end
  resource :session, only: [ :new, :create, :destroy ]
  resources :users
  get "signup" => "users#new"
end


















# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
# Can be used by load balancers and uptime monitors to verify that the app is live.
# get "up" => "rails/health#show", as: :rails_health_check

# Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
# get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
# get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

# Defines the root path route ("/")
# root "posts#index"
=begin

  get "events/new" => "events#new"
  get "events" => "events#index"
  get "events/:id" => "events#show", as: "event"
  get "event/:id/edit" => "events#edit", as: "edit_event"
  patch "events/:id" => "events#update"
  ISSO TUDO PODE SER SUBSTITUÍDO POR ISSO:

   resources :events
=end
