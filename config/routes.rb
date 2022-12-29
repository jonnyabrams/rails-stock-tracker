Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
