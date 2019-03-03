Rails.application.routes.draw do
  root to: redirect('/game')

  resource :game, only: :show

  namespace :api do
    resources :levels, only: %w(index show)
    get :status, to: 'status#show'
  end
end
