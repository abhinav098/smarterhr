Rails.application.routes.draw do
  resources :attendances 
  resources :leaves

  devise_for :users
 	root 'attendances#index'
end
