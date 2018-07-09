Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get 'welcome/about'

  resources :events
  resources  :all_events, :user_events do
    collection do
      get 'day_calendar'
      get 'list'
    end
  end
  get 'users/:id', to: 'users#show', as: 'user_show'
end
