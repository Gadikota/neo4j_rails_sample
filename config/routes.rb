Rails.application.routes.draw do
  get 'locations/create'

  get 'locations/import'

  devise_for :users
  root to: "home#show"
  resource :home, only: :show, controller: "home"
  namespace :dashboard do
    root to: "home#show"
    resources :addresses, only: [:index, :create] do
      collection do
        post :import
      end
    end
  end
end
