Rails.application.routes.draw do

  match '/about',   to: 'pages#about',   via: 'get'

  get 'law_articles/show'

  get 'home/index'

  resources :codes, only: [:index, :show] do
    resources :code_articles, only: [:show]
  end

  resources :laws, only: [:index, :show] do
    resources :law_articles, only: [:show]
  end

  devise_for :users
end
