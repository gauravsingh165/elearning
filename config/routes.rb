Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  get '/admin/index', to: 'admin#index'

  resources :students 
  resources :courses
  resources :enrollments
  resources :users
  resources :admins
  resources :essays, only: [:new, :create, :show]
  root "student#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
