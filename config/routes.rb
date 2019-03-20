Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/signin", to: "sessions#create"
 delete "/signout", to: "sessions#destroy"

 get '/auth/github/callback' => 'sessions#create'


 resources :users, only: [:new, :create, :edit, :update, :show]

 resources :challengeworkouts, only: [:edit, :update]

 resources :challenges, only: [:new, :create, :show] do
   resources :workouts, only: [:new, :create]
 end

end
