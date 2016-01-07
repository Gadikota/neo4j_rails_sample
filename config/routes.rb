Rails.application.routes.draw do
  devise_for :users
  root to: "home#show"
  resource :home, only: :show, controller: "home"
  resources :locations, only: [:index, :create] do
    collection do
      post :import
    end
  end

  namespace :dashboard do
    root to: "home#show"
  end
end
