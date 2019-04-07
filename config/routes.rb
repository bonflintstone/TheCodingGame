Rails.application.routes.draw do
  resources :user_sessions

  get 'login', to: 'user_sessions#new', as: :login
  post 'logout', to: 'user_sessions#destroy', as: :logout

  root to: redirect('/game')

  resource :game, only: :show

  namespace :api do
    resources :levels, only: %w(index show)
    get :status, to: 'status#show'
  end
end
