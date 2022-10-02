Rails.application.routes.draw do
  devise_for :users

  root to: "games#index"
  resources :games, except: :destroy
  get "users/:id/games", to: "games#user_games", as: :user_games

  post "games/:id/order", to: "games#create_order", as: :create_order
  get "orders", to: "orders#index", as: :orders
end
