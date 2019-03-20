Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/signin", to: "sessions#create"
 delete "/signout", to: "sessions#destroy"

 get '/auth/github/callback' => 'sessions#create'


 resources :users, only: [:new, :create, :edit, :update, :show]

 resources :challengeworkouts, only: [:new, :create, :edit, :update]

 resources :challenges do
   resources :workouts, only: [:new, :create]
 end



 resources :workouts, only: [:index, :show, :edit, :update, :destroy]


end
