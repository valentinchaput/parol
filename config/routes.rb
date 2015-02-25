Rails.application.routes.draw do

  resources :laws, only: [:index, :show] do
    resources :amendments, only: [:index, :show] do
  end

  devise_for :users
end
