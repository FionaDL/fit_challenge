Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/signin", to: "sessions#create"
 get "/signout", to: "sessions#destroy"

 get '/auth/github/callback' => 'sessions#create'


 resources :users, only: [:index, :new, :create, :edit, :update, :show]

 #resources :challengeworkouts, only: [:edit, :update]

 resources :challenges, only: [:new, :create, :show] do
   resources :workouts, only: [:new, :create, :index]
 end

 resources :workouts, only: [:index]



end
