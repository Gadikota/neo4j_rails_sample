Rails.application.routes.draw do
  namespace :dashboard do
  get 'home/show'
  end

  devise_for :users
  root to: "home#show"
  resource :home, only: :show, controller: "home"
  namespace :dashboard do
    root to: "home#show"
  end
end
