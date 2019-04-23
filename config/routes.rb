Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root 'dashboard#index'
  delete 'users/:id' => 'users#destroy', :as => :admin_destroy_user

  resources :patient, only: [:new, :create, :index]
  resources :department, only: [:new, :create, :index]
  resources :employee, only: [:new, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
