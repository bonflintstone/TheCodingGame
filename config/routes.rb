Rails.application.routes.draw do
  root to: redirect('/game')

  resource :game

  namespace :api do
    resources :levels, only: %w(index show)
  end
end
