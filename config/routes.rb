Rails.application.routes.draw do
  devise_for :users
  get 'login', to 'sessions#new'
  post 'login', to 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
