Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  get "my_portfolio", to: "users#my_portfolio"

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
