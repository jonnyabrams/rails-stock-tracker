Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root "welcome#index"
  get "my_portfolio", to: "users#my_portfolio"
  get 'search_stock', to: 'stocks#search'
  get "my_friends", to: "users#my_friends"
  get "search_friend", to: 'users#search'
  resources :friendships, only: [:create, :destroy]
  # already got lots of user routes from devise so specify only: :show
  resources :users, only: [:show]

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
