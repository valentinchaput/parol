Rails.application.routes.draw do
  get 'law_articles/show'

  get 'home/index'

  resources :codes, only: [:index, :show] do
    resources :code_article, only: :index
  end

  resources :laws, only: [:index, :show] do
    resources :law_articles, only: [:show]
  end

  devise_for :users
end
