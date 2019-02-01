Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/signin", to: "sessions#create"
 delete "/signout", to: "sessions#destroy"


 resources :users



 resources :challenges do
   resources :workouts, only: [:new, :create]
 end

 resources :challengeworkouts

 resources :workouts, only: [:index, :show, :edit, :update, :destroy]


end
