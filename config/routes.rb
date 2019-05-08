Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root 'dashboard#index'
  delete 'users/:id' => 'users#destroy', :as => :admin_destroy_user

  resources :patient_registrations, only: [:new, :create, :index]
  resources :departments, only: [:new, :create, :index]
  resources :employees, only: [:new, :create, :index, :edit, :update]
  resources :employee_types, only: [:new, :create, :index, :edit, :update]
  resources :shifts, only: [:new, :create, :index]
  resources :duty_entities, only: [:new, :create, :index]
  resources :duty_sheets, only: [:new, :create, :index]
  resources :groups, only: [:new, :create, :index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
