Rails.application.routes.draw do
  resources :issuances
  resources :equipment
  resources :accesses
  resources :attendances
  resources :leaves
  devise_for :users, :controllers => { registrations: 'registrations' } do
    member do
      get :managers, :employees
    end
  end

  get :search, controller: :application

 	root 'attendances#index'
end
