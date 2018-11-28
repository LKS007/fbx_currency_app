Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'updated_index_with_ajx' => 'welcome#updated_index_with_ajx'
  
  get 'signup' => 'users#new'
  resources :users

  get 'exchange_rates/update'
  delete 'exchange_rates/:id' => "exchange_rates#destroy", as: :remove_exchange_rate

  get 'admin' => 'admins#index', :as => :exchange_rates
  post 'admin' => 'admins#create', :as => :exchange_rate
  patch 'admin' => 'admins#update'
  #match 'admin' => 'admins#create', :as => :exchange_rate
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
