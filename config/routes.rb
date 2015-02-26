Rails.application.routes.draw do
  get 'home/index'

  resources :articles, only: [:index, :show]

  resources :laws, only: [:index, :show] do
    resources :amendments, only: [:index, :show]
  end

  devise_for :users
end
