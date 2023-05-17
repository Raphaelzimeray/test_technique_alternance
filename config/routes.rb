Rails.application.routes.draw do
  resources :teams do
    resources :players
  end
  resources :tournaments
  root to: 'tournaments#index'
end
