Rails.application.routes.draw do

  resources :laws, only: [:index, :show]

  devise_for :users
end
