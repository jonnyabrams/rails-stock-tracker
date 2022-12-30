Rails.application.routes.draw do
  resources :user_stocks, only: [:create]
  devise_for :users
  root "welcome#index"
  get "my_portfolio", to: "users#my_portfolio"
  get 'search_stock', to: 'stocks#search'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
