Rails.application.routes.draw do
<<<<<<< HEAD

  match '/about',   to: 'pages#about',   via: 'get'

=======
  ActiveAdmin.routes(self)
>>>>>>> 0db9a4e9a4d31bde4fbe98a0efb8cb7cfafbbf3b
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
