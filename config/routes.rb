Rails.application.routes.draw do
  get 'users/show'
 	root to: 'events#index'
  devise_for :users
  resources :users, only:[:show, :edit]
  resources :events
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
