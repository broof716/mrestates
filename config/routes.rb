Rails.application.routes.draw do
  devise_for :users
  resources :estates
  resources :comments
  root 'intro_pages#index'
  resources :marketplaces, only: [:index, :show] do
    resources :pays, only: :create
  end
  resources :marketplaces
  namespace :operator do
    resources :marketplaces, only: [:new, :create, :show]
    resources :estates, only: [:new, :create, :show]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
