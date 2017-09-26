Rails.application.routes.draw do
  resources :equipment do
    resources :issuances
  end
  resources :issuances, only: :show

  resources :accesses do
    resources :issuances
  end

  resources :attendances
  resources :leaves

  devise_for :users, :controllers => { registrations: 'registrations' } do
    member do
      get :managers, :employees
    end
  end

  resources :searches
 	root 'attendances#index'
end
