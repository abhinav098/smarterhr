Rails.application.routes.draw do
  resources :equipment
  resources :issuances
  resources :accesses
  resources :attendances
  resources :leaves
  root 'attendances#index'

  resources :equipment do
    resources :issuances
  end

  resources :accesses do
    resources :issuances
  end

  devise_for :users, :controllers => { registrations: 'registrations' } do
    member do
      get :managers, :employees
    end
  end

  resources :products, only: [:index]
  # resources :roles,  only: [:create, :destroy]
end
