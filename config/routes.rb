Rails.application.routes.draw do

  get 'static_pages/about'
  root 'products#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'


end
