Rails.application.routes.draw do
  devise_for :users
  resources :breaks
  resources :shifts
  resources :pages
  get 'pages/clockin', to: 'pages#clockin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#clockin'
end
