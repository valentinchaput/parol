Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :codes, only: [:index, :show] do
    resources :code_article, only: :index
  end

  resources :laws, only: [:index, :show] do
    resources :law_articles, only: [:show]
  end

end
