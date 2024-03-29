TomatoSoup::Application.routes.draw do
  
  root :to => 'main#index'
  
  
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'register' => 'users#new'
  match 'profile' => 'users#edit'
  
  
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :projects do
    resources :goals do
      match 'accomplish' => 'goals#accomplish'
      match 'unaccomplish' => 'goals#unaccomplish'
    end
    match 'goals' => 'goals#index'
  end
  
  get 'pomodoro/:goal_id/start' => 'pomodoro#start'
  get 'pomodoro/stop' => 'pomodoro#stop'
  get 'pomodoro' => 'pomodoro#index'
  
  get 'stats' => 'stats#index'
  
  
end
