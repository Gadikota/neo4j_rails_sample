Rails.application.routes.draw do
  devise_for :users
  root to: "home#show"
  resource :home, only: :show, controller: "home"
  namespace :api do
    namespace :v1 do
      resources :meetings
    end
  end
  namespace :dashboard do
    root to: "home#show"
    resources :addresses, only: [:index, :create] do
      collection do
        post :import
      end
    end
  end
end
