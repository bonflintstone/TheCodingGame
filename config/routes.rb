Rails.application.routes.draw do
  resources :user_sessions

  get 'login', to: 'user_sessions#new', as: :login
  get 'logout', to: 'user_sessions#destroy', as: :logout
  get 'admin' , to: 'admin#index'

  root to: redirect('/game')

  resource :game, only: :show

  namespace :api do
    resources :levels, only: %w(index show)
    resources :results, only: :create
    get :status, to: 'status#show'
  end
end
