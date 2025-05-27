Rails.application.routes.draw do
  get 'applications/new'
  get 'applications/create'
  get 'applications/index'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students

  # Keep your existing namespace routes (plural)
  namespace :students do
    get 'dashboard/index'
    get 'dashboard', to: 'dashboard#index'
  end

  # Add this line to allow singular /student/dashboard URL
  get 'student/dashboard', to: 'students/dashboard#index'

  resources :applications, only: [:new, :create, :index]

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
