Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get 'welcome/about'

  resources :events
end
