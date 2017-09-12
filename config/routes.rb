Rails.application.routes.draw do
  resources :equipment
  resources :attendances
  resources :leaves
  devise_for :users, :controllers => { registrations: 'registrations' } do
    member do
      get :managers, :employees
    end
  end

  # resources :roles,  only: [:create, :destroy]

 	root 'attendances#index'
end
