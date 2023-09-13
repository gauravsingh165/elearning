Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  get '/admin/index', to: 'admin#index'

  resources :product_versions, only: [:new, :create, :show]
  resources :product_lines, only: [:new, :create, :show]
 
  resources :product_lines
  resources :mcqs

  resources :students 
  resources :courses
  resources :enrollments
  resources :users
  resources :admins
  resources :essays, only: [:new, :create, :show]
  root "student#index"
end
