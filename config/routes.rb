Rails.application.routes.draw do
 root 'application#home'

 get "/signin", to: "sessions#new"
 post "/sessions/create", to: "sessions#create"
 delete "/signout", to: "sessions#destroy"


 resources :users

end
