Rails.application.routes.draw do
  resources :attendances
  devise_for :users
 	root 'attendances#index'
end
