Rails.application.routes.draw do
  devise_for :users
  root to: "games#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :games, except: :destroy

  get "users/:id/games", to: "games#user_games"
end
