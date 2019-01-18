Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/sessions/create", to: "sessions#create"
 delete "/signout", to: "sessions#destroy"


 resources :users do
   resources :challenges, only: [:new, :create]
   resources :workouts, only: [:new, :create]
 end

 resources :challenges, only: [:index, :show, :edit, :update, :destroy]
 resources :workouts, only: [:index, :show, :edit, :update, :destroy]


end
