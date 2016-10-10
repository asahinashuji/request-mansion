Rails.application.routes.draw do
  root 'users#top'
  get 'renovation', to: 'users#renovation'
  get 'users_wing', to: 'users#wing'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
 
end
