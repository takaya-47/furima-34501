Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :items do
    collection do
      get "search"
    end
    resources :orders, only: [:index, :create]
  end
end
