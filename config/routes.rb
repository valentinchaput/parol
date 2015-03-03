Rails.application.routes.draw do
  get 'amendments/new'

  get 'amendments/edit'

  devise_for :users
  ActiveAdmin.routes(self)

  resources :codes, only: [:index, :show] do
    resources :code_articles, only: [:show]
  end

  resources :laws, only: [:index, :show] do
    resources :law_articles, only: [:show]
  end

end
