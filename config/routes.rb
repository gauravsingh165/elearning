Rails.application.routes.draw do
  get 'textbook/index'
  get 'textbook/new'
  get 'textbook/edit'
  get 'textbook/create'
  get 'textbook/destroy'
  get 'textbook/show'
  get 'user_details/new'
  post 'user_details/create'
   resources :user_details

  devise_for :users, controllers: { registrations: 'registrations' }
  get '/admin/index', to: 'admin#index'
  resources :product_versions
  resources :product_lines
  resources :textbooks

  resources :product_lines
  resources :mcqs
  resources :test_user
  resources :students 
  resources :courses
  resources :enrollments
  resources :users
  resources :admin, only: [:index, :show, :edit, :update]
  resources :essays
  # root "courses#index"
  root "students#index"
end
