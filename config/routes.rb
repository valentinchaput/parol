Rails.application.routes.draw do

  get 'amendments/index' to: 'amendments#index'

  get 'amendments/show' to: 'amendments#show'

  devise_for :users
end
