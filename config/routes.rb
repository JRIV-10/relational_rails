Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  post "/gyms", to: "gyms#create"
  patch "/gyms/:id", to: "gyms#update"
  get "/gyms/:id/edit", to: "gyms#edit"
  get "/gyms/:id", to: "gyms#show"
  delete "/gyms/:id", to: "gyms#destroy"
  
  get "/crossfitters", to: "crossfitters#index"
  get "crossfitters/:id/edit", to: "crossfitters#edit"
  patch "/crossfitters/:id", to: "crossfitters#update"
  get "/crossfitters/:id", to: "crossfitters#show"
  
  get "/gyms/:gym_id/crossfitters/new", to: "gym_crossfitters#new"
  post "/gyms/:gym_id/crossfitters", to: "gym_crossfitters#create"
  get "/gyms/:gym_id/crossfitters", to: "gym_crossfitters#index"
end
