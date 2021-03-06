Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :subscriber_lists
  get 'signup', to: "users#new"
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy'
  resources :subscribers
  resources :bulletins
end
