TomatoSoup::Application.routes.draw do
  
  root :to => 'main#index'
  
  
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'register' => 'users#new'
  
  
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :projects do
    resources :goals
    match 'goals' => 'goals#index'
  end
  
  get 'pomodoro/:goal_id/start' => 'pomodoro#start'
  get 'pomodoro/stop' => 'pomodoro#stop'
  get 'pomodoro' => 'pomodoro#index'
  
  
end
