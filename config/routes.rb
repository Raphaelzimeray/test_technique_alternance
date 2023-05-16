Rails.application.routes.draw do
  root "teams#index"
  resources :teams do
    collection do
      post :generate
    end
  end
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
