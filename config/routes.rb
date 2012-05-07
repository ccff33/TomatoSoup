TomatoSoup::Application.routes.draw do
  
  root :to => 'main#index'
  
  
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'register' => 'users#new'
  
  
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  
end
