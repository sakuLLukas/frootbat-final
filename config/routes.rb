Rails.application.routes.draw do

  root 'products#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

end
