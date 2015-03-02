Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'home/index'

  resources :codes, only: [:index, :show]
  resources :articles, only: [:index, :show]

  resources :laws, only: [:index, :show] do
    resources :amendments, only: [:index, :show]
  end

  devise_for :users
end
