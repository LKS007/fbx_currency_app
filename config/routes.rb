Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  
  get 'signup' => 'users#new'
  resources :users

  get 'admin' => 'admins#index'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
