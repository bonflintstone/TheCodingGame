Rails.application.routes.draw do
  root to: redirect('/game')

  resource :game
end
